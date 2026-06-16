#import "../../config.typ": template, tufted
// Copy this file into content/Blog/YYYY-MM-DD-topic-name/index.typ.
// 中文维护说明：
// 1. 默认公开文章路径仍放在英文侧 `content/Blog/`，中文草稿可以先写中文，再翻译或双语整理。
// 2. 主分类目前使用：AI Infra / Data curation / RL / OPD / Agent。
// 3. AI Infra 子类：triton / c++ / megatron / verl / vllm / slime / sglang。
// 4. Data curation 子类：Data Mixture / Data Selection / Data Filtering。
// 5. RL、OPD、Agent 子类先留空；等方向稳定后同时更新中英文归档页。
// 6. 约定 `category` 写主分类，`tags` 第一个位置优先写子类，后面再写技术关键词。
#show: template.with(
  title: "Article Title",
  description: "One-sentence summary for the archive, RSS feed, and search results.",
  date: datetime(year: 2026, month: 1, day: 1),
  extra-info: [Category: AI Infra · Tags: triton / performance],
)

= Article Title

Use one paragraph to state the problem, the intended reader, and the practical takeaway.

== Background

Explain the context, prerequisites, and constraints.

== Core Takeaways

- Takeaway one.
- Takeaway two.
- Takeaway three.

== Process

Keep the reasoning, experiments, code, pitfalls, and tradeoffs reproducible.

== Quick Reference

- Commands:
- Key concepts:
- References:

== Retrospective

Record the methods worth reusing and the mistakes to avoid next time.
