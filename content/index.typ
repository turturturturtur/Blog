#import "../config.typ": template, tufted
#show: template.with(
  title: "技术笔记与学习经验",
  description: "记录工程实践、技术文章、学习经验和可复用速查笔记。",
)

#tufted.margin-note[
  计划中的写作流：草稿先在飞书或其他工具沉淀；整理后转成 Typst 文章；本地构建校验；提交到 GitHub，由 GitHub Actions 自动部署。
]

= 技术笔记与学习经验

这里记录我在技术学习和工程实践中的文章、速查笔记和经验复盘。内容会优先面向可复用的知识：一个问题怎么拆、一个概念怎么查、一次实践踩过哪些坑。

== 主要入口

#tufted.full-width[
  #html.div(
    class: "topic-grid",
    {
      html.elem(
        "a",
        attrs: (class: "topic-card", href: "Blog/"),
        {
          html.elem("strong", "文章归档")
          html.p("按主题、年份和标签整理技术文章与学习笔记。")
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
        attrs: (class: "topic-card", href: "feed.xml"),
        {
          html.elem("strong", "RSS 订阅")
          html.p("订阅后可以跟踪后续新增文章。")
        },
      )
    },
  )
]

== 内容方向

- *编程语言与工程实践*：Python、类型系统、测试、构建、调试和性能分析。
- *系统与工具链*：Linux、Git、CI/CD、开发环境和自动化脚本。
- *数据与数学基础*：概率统计、机器学习基础、实验记录和可视化。
- *学习经验复盘*：读书笔记、课程总结、问题拆解方法和阶段性回顾。

== 写作工作流

以后新增文章时，推荐保持这个流程：

1. 在飞书或其他草稿工具里先写出原始材料。
2. 我把草稿整理成结构化文章，补齐标题、摘要、分类、标签和参考链接。
3. 生成 `content/Blog/YYYY-MM-DD-topic-name/index.typ`。
4. 运行 `uv run build.py build -f` 校验站点。
5. 提交并推送到 GitHub，触发 GitHub Pages 部署。
