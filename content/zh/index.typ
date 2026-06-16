#import "../../config.typ": template, tufted

#let zh-template = template.with(
  lang: "zh",
  header-links: (
    "/zh/": "首页",
    "/zh/Blog/": "文章",
    "/zh/Docs/": "文档",
    "/CV/": "简历",
  ),
  website-title: "一个普通的黄桃的博客",
  description: "记录 AI Infra、Data curation、Math、RL、OPD、Agent、项目管理经验和可复用工程速查笔记。",
)

#show: zh-template.with(
  title: "一个普通的黄桃的博客",
  description: "记录 AI Infra、Data curation、Math、RL、OPD、Agent、项目管理经验和可复用工程速查笔记。",
)

#tufted.margin-note[
  这个站点保留 Tufte 风格的宽边栏：正文负责展开思路，边注负责补充背景、提醒和索引，不打断阅读节奏。
]

#tufted.margin-note[
  计划中的写作流：草稿先在飞书或其他工具沉淀；整理后转成 Typst 文章；本地构建校验；提交到 GitHub，由 GitHub Actions 自动部署。
]

= 一个普通的黄桃的博客

这里记录我在技术学习和工程实践中的文章、速查笔记和经验复盘。它不是模板说明页，而是一个面向长期积累的个人技术博客：问题怎么拆、概念怎么查、实践中踩过哪些坑，都尽量写成以后还能复用的材料。

#figure(caption: "Tufte 风格的阅读与写作布局")[#image("../imgs/devices.webp")]

== 阅读入口

#tufted.full-width[
  #html.div(
    class: "topic-grid",
    {
      html.elem(
        "a",
        attrs: (class: "topic-card", href: "Blog/"),
        {
          html.elem("strong", "文章归档")
          html.p("按当前分类、年份和标签整理技术文章。")
        },
      )
      html.elem(
        "a",
        attrs: (class: "topic-card", href: "Blog/#quick-index"),
        {
          html.elem("strong", "速查索引")
          html.p("把常用概念、工具链和实践经验整理成可快速定位的入口。")
        },
      )
      html.elem(
        "a",
        attrs: (class: "topic-card", href: "../feed.xml"),
        {
          html.elem("strong", "RSS 订阅")
          html.p("订阅后可以跟踪后续新增文章。")
        },
      )
    },
  )
]

== 为什么保留 Tufte 风格

Tufte 风格适合技术写作：主栏放连续论证，边栏放补充说明、图表解释和旁注。这样一篇文章既能按顺序读，也能在复查时快速扫到关键提醒。对我来说，它比普通信息流更适合写学习笔记、工程复盘和概念速查。

以后这里会尽量维持这样的排版习惯：标题直接说明主题，开头给结论和适用场景，正文记录推导与实践过程，边注保存不适合塞进正文的参考、提醒和扩展。

== 内容方向与分类

// 这里的主分类顺序需要和英文首页、英文 Blog 归档保持一致。
// 如果以后新增类似方向，先更新英文 `content/index.typ` 和 `content/Blog/index.typ`，再同步这里。
- *AI Infra*：triton、c++、megatron、verl、vllm、slime、sglang、分布式训练、推理服务和性能工程。
- *Data curation*：Data Mixture、Data Selection、Data Filtering、质量检查和训练数据反馈闭环。
- *Math*：矩阵微积分、线性代数、优化笔记、迹技巧、矩阵求导和反向传播推导。
- *RL*：强化学习算法、奖励设计、评测、稳定性和实验记录。
- *OPD*：先作为独立工作流保留，等内容稳定后再拆子类。
- *Agent*：工具调用、记忆、规划、评测、产品闭环，以及实际 agent 系统周边的基础设施。
- *项目管理经验*：目标对齐、推进节奏、跨团队沟通、交付风险和复盘笔记。

== 写作与发布工作流

以后新增文章时，推荐保持这个流程：

1. 在飞书或其他草稿工具里先写出原始材料。
2. 我把草稿整理成结构化文章，补齐标题、摘要、分类、标签和参考链接。
3. 生成 `content/Blog/YYYY-MM-DD-topic-name/index.typ`。
4. 运行 `uv run build.py build -f` 校验站点。
5. 提交并推送到 GitHub，触发 GitHub Pages 部署。
