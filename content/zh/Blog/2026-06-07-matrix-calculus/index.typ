#import "../../../../config.typ": template, tufted

#let zh-template = template.with(
  lang: "zh",
  header-links: (
    "/zh/": "首页",
    "/zh/Blog/": "文章",
    "/zh/Docs/": "文档",
    "/CV/": "简历",
  ),
  website-title: "一个普通的黄桃的博客",
 description: "记录 AI Infra、Data curation、Math、RL、OPD、Agent 和可复用工程速查笔记。",
)

#show: zh-template.with(
 title: "矩阵求导：从迹技巧到 MLP 反向传播",
  description: "从迹（trace）的基本性质出发，系统推导矩阵求导规则，并将其应用到多层感知机的完整反向传播过程。",
  date: datetime(year: 2026, month: 6, day: 7),
  lang: "zh",
 extra-info: [Math · 矩阵求导],
)

= 矩阵求导：从迹技巧到 MLP 反向传播

矩阵求导在优化和深度学习中无处不在，但符号体系往往比较混乱。本文保持具体：从迹的基本性质出发，建立一小套求导规则，然后端到端地推导多层感知机（MLP）的反向传播过程。

== 迹：核心工具

方阵的迹是对角线元素之和：$op("tr")(A) = sum_i A_(i i)$。它在矩阵求导中的威力来自三个事实。

#text(size:11pt)[
  *线性性.* $op("tr")(alpha A + beta B) = alpha op("tr")(A) + beta op("tr")(B)$，其中 $alpha, beta$为标量。

  *循环不变性.* $op("tr")(A B) = op("tr")(B A)$，只要乘积是良定义的方阵。更一般地，$op("tr")(A B C) = op("tr")(B C A) = op("tr")(C A B)$。乘积的任意循环移位都不改变迹。

  *标量即迹.*对任意标量 $s$，有 $s = op("tr")(s)$。这看似平凡，但能让我们把标量值函数写成迹的形式，然后穿过迹求导。
]

这三个事实足以把大多数矩阵求导问题转化为直接的迹操作。

=== 布局约定

本文采用 _分母布局_：当 $f$为标量值时，$partial f \/ partial X$的形状与 $X^top$相同。实践中这意味着 $partial f \/ partial X_(i j)$位于结果矩阵的 $(j, i)$位置，与大多数自动微分框架的输出一致。以下所有公式均遵循此约定。

== 核心求导规则

设 $X$为矩阵变量，$A, B, C$为常矩阵（与 $X$无关）。以下规则都可以通过展开迹、应用线性性和循环性质并读出系数得到。

#text(size:11pt)[
  + $partial \/ partial X op("tr")(A X) = A^top$

  + $partial \/ partial X op("tr")(X A) = A^top$

  + $partial \/ partial X op("tr")(X^top A) = A$

  + $partial \/ partial X op("tr")(X A X^top B) = B^top X A^top + B X A$

  + $partial \/ partial X op("tr")(A X B X^top) = A^top X B^top + A X B$（使用时注意布局约定）
]

第一条规则是最常用的。如果损失能写成 $op("tr")(C X)$的形式，其中 $C$不含 $X$，那么导数就是 $C^top$。

=== 示例：线性最小二乘

考虑 $L =1\/2 norm(A X - B)_F^2$，其中 $A$为 $m times n$，$X$为 $n times p$，$B$为 $m times p$。写成迹形式：

$
  L =1\/2 op("tr")((A X - B)^top (A X - B))
  =1\/2 op("tr")(X^top A^top A X) - op("tr")(X^top A^top B) +1\/2 op("tr")(B^top B)
$

逐项求导：

$
  partial L \/ partial X = A^top A X - A^top B
$

令导数为零即得到正规方程 $A^top A X = A^top B$。迹方法避免了逐元素求和，保持了推导的紧凑性。

== MLP 设定

考虑 $L$层 MLP。对第 $l in {1, dots, L}$层：

$
  Z^((l)) = W^((l)) A^((l-1)) + b^((l)) , quad
  A^((l)) = sigma^((l))(Z^((l)))
$

其中 $A^((0)) = X$（输入），$A^((L)) = hat(y)$（输出），$sigma^((l))$是逐元素激活函数。权重 $W^((l)) in RR^(d_l times d_(l-1))$，偏置 $b^((l)) in RR^(d_l times 1)$。

对单个训练样本及标签 $y$，定义标量损失 $cal(L)(hat(y), y)$。

== 反向传播

定义第 $l$层的 _局部梯度_为

$
  delta^((l)) = partial cal(L) \/ partial Z^((l))
$

其形状与 $Z^((l))$相同，即 $d_l times 1$。我们从顶层向下递推计算。

=== 输出层

$
  delta^((L)) = partial cal(L) \/ partial Z^((L))
  = partial cal(L) \/ partial A^((L)) \odot sigma^((L)prime)(Z^((L)))
$

其中 $\odot$表示逐元素乘法，$sigma^((L)prime)$是激活函数的导数（逐元素应用）。这是标量链式法则的逐元素版本。

=== 隐藏层

对 $l < L$，需要求 $partial cal(L) \/ partial Z^((l))$。损失仅通过 $A^((l))$依赖 $Z^((l))$，而 $A^((l))$又输入到 $Z^((l+1))$。用迹形式来写链式法则以保持维度清晰。

先写出第 $l+1$层第 $k$个输出单元的贡献：

$
  Z_k^((l+1)) = sum_j W_(k j)^((l+1)) sigma_j^((l))(Z^((l))) + b_k^((l+1))
$

损失关于 $Z^((l))$的全微分为

$
  d cal(L) = op("tr")((partial cal(L) \/ partial Z^((l+1)))^top d Z^((l+1)))
$

由于 $d Z^((l+1)) = W^((l+1)) (sigma^((l)prime)(Z^((l))) \odot d Z^((l)))$，并利用迹的循环性质：

$
  d cal(L) = op("tr")((delta^((l+1)))^top W^((l+1)) op("diag")(sigma^((l)prime)(Z^((l)))) d Z^((l)))
$

读出 $d Z^((l))$的系数：

$
  delta^((l)) = (W^((l+1)))^top delta^((l+1)) \odot sigma^((l)prime)(Z^((l)))
$

这就是经典的反向传播递推公式。迹方法把它变成了一行推导，而不是满屏的下标求和。

=== 权重梯度

拿到所有 $delta^((l))$之后，权重和偏置的梯度就机械地得出了。写出 $Z^((l)) = W^((l)) A^((l-1)) + b^((l))$，分离含 $W^((l))$的项：

$
  d cal(L) = op("tr")((delta^((l)))^top d W^((l)) A^((l-1)))
  = op("tr")(A^((l-1)) (delta^((l)))^top d W^((l)))
$

因此

$
  partial cal(L) \/ partial W^((l)) = delta^((l)) (A^((l-1)))^top
$

偏置梯度：

$
  partial cal(L) \/ partial b^((l)) = delta^((l))
$

=== 反向传播总结

给定单样本 $(x, y)$：

#text(size:11pt)[
  1. *前向.*对 $l =1, dots, L$计算 $Z^((l)), A^((l))$，缓存所有中间激活值。

  2. *输出层 delta.* $delta^((L)) = nabla_(A^((L))) cal(L) \odot sigma^((L)prime)(Z^((L)))$。

  3. *反向递推.*对 $l = L-1, dots,1$：
    $ delta^((l)) = (W^((l+1)))^top delta^((l+1)) \odot sigma^((l)prime)(Z^((l))) $

  4. *梯度.*对各层 $l$：
    $
      partial cal(L) \/ partial W^((l)) = delta^((l)) (A^((l-1)))^top, quad partial cal(L) \/ partial b^((l)) = delta^((l))
    $
]

对大小为 $m$的 mini-batch，将激活值按列堆叠成矩阵 $Z^((l)) in RR^(d_l times m)$和 $A^((l)) in RR^(d_l times m)$。公式基本不变，权重梯度取 batch内平均（乘以 $1\/m$）。

== 具体示例：两层 MLP + MSE 损失

为了更具体，取 $L =2$，隐藏层激活 $sigma = op("ReLU")$，输出层恒等映射，均方误差损失：

$
  cal(L) =1\/2 norm(hat(y) - y)^2
$

前向传播：

$
  Z^((1)) = W^((1)) x + b^((1)), quad A^((1)) = op("ReLU")(Z^((1)))
$
$
  hat(y) = W^((2)) A^((1)) + b^((2))
$

输出层 delta（输出激活为恒等，故 $sigma^((2)prime) =1$）：

$
  delta^((2)) = hat(y) - y
$

隐藏层 delta：

$
  delta^((1)) = (W^((2)))^top (hat(y) - y) \odot bb(1)[Z^((1)) >0]
$

其中 $bb(1)[Z^((1)) >0]$是指示函数（ReLU的导数），逐元素应用。

梯度：

$
  partial cal(L) \/ partial W^((2)) = (hat(y) - y) (A^((1)))^top, quad
  partial cal(L) \/ partial b^((2)) = hat(y) - y
$
$
  partial cal(L) \/ partial W^((1)) = delta^((1)) x^top, quad
  partial cal(L) \/ partial b^((1)) = delta^((1))
$

== 为什么用迹方法？

比起逐元素展开，迹方法有两个优势：

#text(size:11pt)[
  *紧凑.*循环性质把冗长的下标求和压缩为单步迹操作。用下标记法要写半页的推导，用迹三行就能完成。

  *形状检查.*每个中间表达式都有清晰的矩阵形状。如果得到的 $partial cal(L) \/ partial W$形状和 $W$对不上，马上就知道哪里出错了。迹推导让形状不一致暴露得非常明显。
]

迹方法不是花招——当目标函数为标量值时（这几乎覆盖了所有监督学习场景），它就是矩阵求导的自然语言。

== 参考与扩展阅读

基于迹的矩阵求导方法在 Matrix Cookbook  @petersen2008matrix 和 Magnus与 Neudecker的 _Matrix Differential Calculus_  @magnus2019matrix 中有系统论述。用迹推导反向传播的思路与 Rumelhart--Hinton--Williams的原始论文  @rumelhart1986learning 一致，但全部保持在矩阵形式下进行。

#bibliography("../../../../content/Blog/2026-06-07-matrix-calculus/refs.bib")
