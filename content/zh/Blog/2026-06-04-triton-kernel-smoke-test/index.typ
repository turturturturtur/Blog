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
  description: "记录 AI Infra、Data curation、Math、RL、OPD、Agent和可复用工程速查笔记。",
)

#show: zh-template.with(
  title: "Triton Kernel 冒烟测试",
  description: "一篇简短的 AI Infra 笔记，验证 triton 主题的文章能否正常进入分类、归档和构建流程。",
  date: datetime(year: 2026, month: 6, day: 4),
  lang: "zh",
  extra-info: [Category: AI Infra · Tags: triton / kernel / 性能],
)

= Triton Kernel 冒烟测试

这是一篇刻意精简的 AI Infra 文章。它的目的不是深入讲解 Triton，而是证明一篇新文章可以进入 `AI Infra` 分类、携带 `triton` 子类标签、出现在归档中，并通过完整的 Typst 构建。

#tufted.margin-note[
  冒烟测试的目标：让文章足够小，这样构建失败就能指向站点管道而非文章复杂性。
]

== 心智模型

当张量操作足够规则、可以清晰映射到块，但又足够特殊、框架原语要么缺失要么无法榨干性能时，Triton 就派上用场了。一个好的首个内核通常具备三个性质：

- 输入和输出形状易于描述；
- 每个程序实例拥有一个可预测的 tile；
- 边界掩码显式且易于审计。

== 精简检查清单

在将 Triton kernel 视为生产基础设施之前，我会检查：

- 与朴素 PyTorch 参考实现的正确性对比；
- 代表性 dtype 下的数值行为；
- launch 配置的敏感性，尤其是 block size 和 warp 数量；
- 内存访问模式，包括合并访问和不必要的重加载；
- 预热和重复运行下的基准稳定性。

== 要点

对于 AI 基础设施笔记，有用的单位往往是一份检查清单加上一个可复现实验。检查清单让工程判断保持可见，而实验则为未来读者提供了可以重新运行的具体东西。
