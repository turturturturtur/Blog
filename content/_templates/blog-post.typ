#import "../../config.typ": template, tufted
// Copy this file into content/Blog/YYYY-MM-DD-topic-name/index.typ.
// Fill title, description, date, category, and tags before publishing.
#show: template.with(
  title: "文章标题",
  description: "一句话摘要，供文章列表、RSS 和搜索结果使用。",
  date: datetime(year: 2026, month: 1, day: 1),
  extra-info: [分类：待分类 · 标签：标签一 / 标签二],
)

= 文章标题

用一段话说明这篇文章解决什么问题、适合谁读、读完能带走什么。

== 背景

说明问题出现的上下文、前置知识和约束。

== 核心结论

- 结论一。
- 结论二。
- 结论三。

== 过程记录

把推导、实验、代码、踩坑和取舍写清楚。技术文章优先保留可复现步骤。

== 速查

- 常用命令：
- 关键概念：
- 参考链接：

== 复盘

记录这次学习或实践中可以复用的方法，以及下次需要避免的问题。
