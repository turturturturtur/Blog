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
  description: "记录工程实践、技术文章、学习经验和可复用速查笔记。",
)

#show: zh-template.with(
  title: "文档",
  description: "Tufted Blog Template 文档索引。",
)

= 文档

- 中文文档
  - #link("/Docs/website-config/", "网站配置")
  - #link("/Docs/typst-example/", "Typst 功能速览与样例")
  - #link("/Docs/github-deploy/", "GitHub 网站部署")
  - #link("/Docs/custom-styling/", "自定义样式")
- English Documents
  - #link("/Docs/website-config-en/", "Website Configuration")
  - #link("/Docs/typst-example-en/", "Typst Example")
  - #link("/Docs/github-deploy-en/", "GitHub Deployment")
  - #link("/Docs/custom-styling-en/", "Custom Styling")
