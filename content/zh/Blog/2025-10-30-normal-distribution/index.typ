#import "../../../../config.typ": template, tufted
#import "@preview/lilaq:0.6.0" as lq

#let zh-template = template.with(
  lang: "zh",
  header-links: (
    "/zh/": "首页",
    "/zh/Blog/": "文章",
    "/zh/Docs/": "文档",
    "/CV/": "简历",
  ),
  website-title: "一个普通的黄桃的博客",
  description: "记录 AI Infra、Data curation、Math、RL、OPD、Agent和可复用工程速查笔记。",
)

#show: zh-template.with(
  title: "正态分布：统计学中的基础概念",
  description: "深入探讨正态分布的性质、意义及其在各领域中的实际应用。",
  date: datetime(year: 2025, month: 10, day: 30),
  lang: "zh",
)

= 正态分布

正态分布，常被称为高斯分布或钟形曲线，是统计学和概率论中最基础的概念之一 @degroot2012probability。其标志性的对称钟形曲线广泛出现在自然界和人类活动中，从身高、考试分数到测量误差和生物变异，无处不在。

== 关键性质

正态分布完全由两个参数决定：均值（$mu$）和标准差（$sigma$）@rice2006mathematical。均值决定分布的中心位置，标准差控制其展宽程度。约 68% 的值落在均值的一个标准差范围内，95% 在两个标准差内，99.7% 在三个标准差内——这一规律被称为经验法则或 68-95-99.7 法则。

其概率密度函数为：

$ f(x) = 1/(sigma sqrt(2pi)) e^(-(x-mu)^2/(2sigma^2)) $

这一公式由高斯在其天文学研究中提出 @gauss1809theoria，已成为现代统计学的基础 @stigler1982gauss。


#{
  let diagram = html.frame(lq.diagram(
    xaxis: (subticks: none),
    yaxis: (subticks: none),
    lq.bar(
      range(-7, 8).map(x => x / 2.0),
      range(-7, 8).map(x => {
        let z = x / 2.0
        calc.exp(-z * z / 2) / calc.sqrt(2 * calc.pi)
      }),
      fill: blue.lighten(50%),
    ),
  ))

  figure(caption: [正态分布], diagram)
}


== 为什么重要

正态分布的重要性源于中心极限定理，#footnote[中心极限定理要求被求和的随机变量独立同分布且具有有限方差。随着变量数量的增加，收敛到正态分布的效果越好。]该定理指出：大量独立随机变量之和趋向于正态分布，无论原始分布是什么。这解释了为什么如此多的自然现象遵循这一模式。

在实践中，正态分布使以下应用成为可能：
- 统计推断与假设检验
- 制造业中的质量控制
- 金融领域的风险评估
- 自然测量的建模

== 实际应用

科学家使用正态分布来建模从智商分数到气体中粒子速度的各种现象。工程师将其应用于可靠性分析和信号处理。金融分析师依赖它进行投资组合理论和期权定价，尽管实际市场回报往往偏离正态性。#footnote[金融回报通常表现出"肥尾"（极端事件概率更高）和偏态，与正态分布相比有所偏离。这对风险管理和衍生品定价有重要影响。]

理解正态分布为统计思维和数据分析奠定了基础，使其成为无数领域中研究人员、分析师和决策者不可或缺的工具。

#bibliography("../../../../content/Blog/2025-10-30-normal-distribution/refs.bib")
