#import "../index.typ": template, tufted
#show: template.with(
  title: "文章归档",
  description: "按主题、年份和标签整理技术文章、学习经验和速查笔记。",
)

= 文章归档

这里按主题维护文章入口。每篇文章保留一个主分类、若干标签和一句摘要，方便后续从飞书草稿整理时快速放入正确位置。

#html.elem(
  "div",
  attrs: (id: "quick-index", class: "quick-index"),
  {
    html.elem("strong", "速查入口")
    html.elem("a", attrs: (href: "#programming"), "编程语言")
    html.elem("a", attrs: (href: "#data-math"), "数据与数学")
    html.elem("a", attrs: (href: "#study-notes"), "学习笔记")
    html.elem("a", attrs: (href: "#timeline"), "时间线")
  },
)

#html.elem("h2", attrs: (id: "programming"), "编程语言")

#tufted.blog-entry(
  date: "2024-10-04",
  path: "2024-10-04-iterators-generators/",
  title: "Iterators vs Generators in Python",
  category: "编程语言",
  tags: ("Python", "迭代协议", "生成器"),
  description: "理解 Python 迭代器和生成器的差异，以及什么时候使用它们。",
)

#html.elem("h2", attrs: (id: "data-math"), "数据与数学")

#tufted.blog-entry(
  date: datetime(year: 2025, month: 10, day: 30),
  path: "2025-10-30-normal-distribution/",
  title: "Normal Distribution",
  category: "数据与数学",
  tags: ("统计", "概率分布", "基础概念"),
  description: "梳理正态分布的核心性质、公式和常见应用场景。",
)

#html.elem("h2", attrs: (id: "study-notes"), "学习笔记")

#tufted.blog-entry(
  date: datetime(year: 2025, month: 4, day: 16),
  path: "2025-04-16-monkeys-apes",
  title: "Monkeys vs Apes",
  category: "学习笔记",
  tags: ("概念辨析", "阅读笔记"),
  description: "一篇保留的学习笔记示例，可作为后续非技术笔记的占位参考。",
)

#html.elem("h2", attrs: (id: "timeline"), "时间线")

== 2025

#tufted.blog-entry(
  date: datetime(year: 2025, month: 10, day: 30),
  path: "2025-10-30-normal-distribution/",
  title: "Normal Distribution",
  category: "数据与数学",
  tags: ("统计", "概率分布"),
)
#tufted.blog-entry(
  date: datetime(year: 2025, month: 4, day: 16),
  path: "2025-04-16-monkeys-apes",
  title: "Monkeys vs Apes",
  category: "学习笔记",
  tags: ("概念辨析",),
)

== 2024

#tufted.blog-entry(
  date: "2024-10-04",
  path: "2024-10-04-iterators-generators/",
  title: "Iterators vs Generators in Python",
  category: "编程语言",
  tags: ("Python", "生成器"),
)
