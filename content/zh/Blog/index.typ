#import "../../../config.typ": template, tufted

#let zh-template = template.with(
  lang: "zh",
  header-links: (
    "/zh/": "首页",
    "/zh/Blog/": "文章",
    "/zh/Docs/": "文档",
    "/CV/": "简历",
  ),
  website-title: "一个普通的黄桃的博客",
  description: "记录 AI Infra、Data curation、Math、RL、OPD、Agent、Tech Report Analysis 和可复用工程速查笔记。",
)

#show: zh-template.with(
  title: "文章归档",
  description: "按当前技术写作分类整理技术文章和可复用速查笔记。",
)

// 分类维护说明：
// 1. 英文公开标签以 `content/Blog/index.typ` 为准；中文页只翻译说明文字，不改主分类英文名。
// 2. 新增主分类时：先在 quick-index 加锚点，再在正文里复制一个 h2 区块。
// 3. 新增子类时：同时更新英文页和中文页的 Subcategories/子类 chips。
// 4. 新增文章时：先创建 `content/Blog/YYYY-MM-DD-topic-name/index.typ`，再在中英文归档页都加同一条 `tufted.blog-entry`。
// 5. 中文页里的文章 path 需要从 `content/zh/Blog/` 跳回英文文章目录，所以一般写成 `../../Blog/YYYY-MM-DD-topic-name/`。
// 6. 约定：`category` 写主分类；`tags` 的第一个位置优先放子类，后面再放技术点或关键词。
// 7. 强制对齐：修改英文归档的 quick-index、h2 id、子类 chips 或 timeline 时，必须同步检查并更新本中文归档。

#html.elem(
  "div",
  attrs: (id: "quick-index", class: "quick-index"),
  {
    html.elem("strong", "速查入口")
    html.elem("a", attrs: (href: "#ai-infra"), "AI Infra")
    html.elem("a", attrs: (href: "#data-curation"), "Data curation")
    html.elem("a", attrs: (href: "#math"), "Math")
    html.elem("a", attrs: (href: "#rl"), "RL")
    html.elem("a", attrs: (href: "#opd"), "OPD")
    html.elem("a", attrs: (href: "#agent"), "Agent")
    html.elem("a", attrs: (href: "#tech-report-analysis"), "技术报告分析")
    html.elem("a", attrs: (href: "#project-management-experience"), "项目管理经验")
    html.elem("a", attrs: (href: "#timeline"), "时间线")
  },
)

#html.elem("h2", attrs: (id: "ai-infra"), "AI Infra")

训练和推理基础设施笔记：kernel、分布式训练、推理服务、性能工程和框架内部机制。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "triton")
    html.span(class: "blog-entry-tag", "c++")
    html.span(class: "blog-entry-tag", "megatron")
    html.span(class: "blog-entry-tag", "verl")
    html.span(class: "blog-entry-tag", "vllm")
    html.span(class: "blog-entry-tag", "slime")
    html.span(class: "blog-entry-tag", "sglang")
  },
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 4),
  path: "2026-06-04-triton-kernel-smoke-test/",
  title: "Triton Kernel 冒烟测试",
  category: "AI Infra",
  tags: ("triton", "kernel", "性能"),
  description: "一篇很短的 AI Infra 测试文章，用来验证 triton 主题能正常进入归档、分类和构建流程。",
)

#html.elem("h2", attrs: (id: "data-curation"), "Data curation")

面向模型训练和评测的数据流程笔记：混合比例、选择标准、过滤规则、质量检查和反馈闭环。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "Data Mixture")
    html.span(class: "blog-entry-tag", "Data Selection")
    html.span(class: "blog-entry-tag", "Data Filtering")
  },
)

#html.p(class: "blog-entry-description", "暂无已发布文章。新增文章时 category 建议写 Data curation，tags 的第一个位置放对应子类。")

#html.elem("h2", attrs: (id: "math"), "Math")

矩阵微积分、线性代数与优化笔记：迹技巧、矩阵求导、反向传播推导和数值线性代数。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "Matrix Calculus")
    html.span(class: "blog-entry-tag", "Linear Algebra")
    html.span(class: "blog-entry-tag", "Optimization")
  },
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 7),
  path: "2026-06-07-matrix-calculus/",
  title: "矩阵求导：从迹技巧到 MLP 反向传播",
  category: "Math",
  tags: ("Matrix Calculus", "反向传播"),
  description: "从迹技巧出发，系统推导矩阵求导规则，并应用到多层感知机的完整反向传播过程。",
)

#html.elem("h2", attrs: (id: "rl"), "RL")

强化学习笔记：算法、奖励设计、评测、训练稳定性和实际实验记录。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "待补充")
  },
)

#html.p(class: "blog-entry-description", "暂无已发布文章。这里的子类先留空，等 RL 方向写出几篇后再抽出稳定分组。")

#html.elem("h2", attrs: (id: "opd"), "OPD")

OPD 暂时作为独立工作流保留，避免早期内容混进 AI Infra 或 RL 后续不好拆。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "待补充")
  },
)

#html.p(class: "blog-entry-description", "暂无已发布文章。这里的子类先按你的要求留空。")

#html.elem("h2", attrs: (id: "agent"), "Agent")

Agent 系统笔记：工具调用、记忆、规划、评测、产品闭环，以及让 agent 真正可用所需要的基础设施。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "待补充")
  },
)

#html.p(class: "blog-entry-description", "暂无已发布文章。等 Agent 方向自然长出稳定主题后再补子类。")

#html.elem("h2", attrs: (id: "tech-report-analysis"), "技术报告分析")

面向主流开源大模型家族的技术报告分析：模型结构、训练数据、后训练方法、评测结果、效率设计和部署影响。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "DeepSeek")
    html.span(class: "blog-entry-tag", "MiniMax")
    html.span(class: "blog-entry-tag", "MiMo")
    html.span(class: "blog-entry-tag", "GLM")
    html.span(class: "blog-entry-tag", "Qwen")
    html.span(class: "blog-entry-tag", "OLMo")
    html.span(class: "blog-entry-tag", "其他开源模型")
  },
)

#html.p(class: "blog-entry-description", "暂无已发布文章。新增文章时 category 建议写技术报告分析，tags 的第一个位置放对应模型家族。")

#html.elem("h2", attrs: (id: "project-management-experience"), "项目管理经验")

来自实际工作的项目管理笔记：目标对齐、范围控制、推进节奏、干系人沟通、交付风险和复盘方法。

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "子类")
    html.span(class: "blog-entry-tag", "计划")
    html.span(class: "blog-entry-tag", "执行")
    html.span(class: "blog-entry-tag", "复盘")
  },
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 9),
  path: "2026-06-09-project-management-experience/",
  title: "项目管理经验：从目标对齐到交付复盘",
  category: "项目管理经验",
  tags: ("计划", "执行", "复盘"),
  description: "一篇示例性的项目管理经验笔记，记录如何把模糊目标变成可对齐的范围、节奏、风险控制和交付复盘。",
)

#html.elem("h2", attrs: (id: "timeline"), "时间线")

== 2026

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 9),
  path: "2026-06-09-project-management-experience/",
  title: "项目管理经验：从目标对齐到交付复盘",
  category: "项目管理经验",
  tags: ("计划", "执行", "复盘"),
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 4),
  path: "2026-06-04-triton-kernel-smoke-test/",
  title: "Triton Kernel 冒烟测试",
  category: "AI Infra",
  tags: ("triton", "kernel", "性能"),
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 7),
  path: "2026-06-07-matrix-calculus/",
  title: "矩阵求导：从迹技巧到 MLP 反向传播",
  category: "Math",
  tags: ("Matrix Calculus", "反向传播"),
)

== 2025

#tufted.blog-entry(
  date: datetime(year: 2025, month: 10, day: 30),
  path: "2025-10-30-normal-distribution/",
  title: "正态分布：统计学中的基础概念",
  category: "Example / Legacy",
  tags: ("统计", "概率分布"),
)
#tufted.blog-entry(
  date: datetime(year: 2025, month: 4, day: 16),
  path: "2025-04-16-monkeys-apes",
  title: "猴与猿：理解两者的区别",
  category: "Example / Legacy",
  tags: ("概念辨析",),
)

== 2024

#tufted.blog-entry(
  date: "2024-10-04",
  path: "2024-10-04-iterators-generators/",
  title: "Python 中的迭代器与生成器",
  category: "Example / Legacy",
  tags: ("Python", "生成器"),
)
