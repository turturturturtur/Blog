#import "../index.typ": template, tufted

// 中文维护说明：
// 这是一篇 AI Infra / triton 的最小测试文章，用来验证新增文章、归档入口、RSS 和构建链路。
// 后续正式文章可以复制这个结构：metadata 写英文，正文默认英文；中文解释可以先留在注释或之后单独拆中文版本。
#show: template.with(
  title: "Triton Kernel Smoke Test",
  description: "A short AI infrastructure note that checks whether the blog taxonomy, archive entry, and build pipeline work for a Triton topic.",
  date: datetime(year: 2026, month: 6, day: 4),
  lang: "en",
  extra-info: [Category: AI Infra · Tags: triton / kernel / performance],
)

= Triton Kernel Smoke Test

This is a deliberately small AI Infra article. Its job is not to teach Triton deeply, but to prove that a new post can enter the `AI Infra` category, carry the `triton` subcategory tag, appear in the archive, and pass the full Typst build.

#tufted.margin-note[
  Smoke-test goal: keep the article small enough that build failures point to the site plumbing rather than article complexity.
]

== Mental Model

Triton is useful when a tensor operation is regular enough to map cleanly onto blocks, but custom enough that a framework primitive is either missing or leaves performance on the table. A good first kernel usually has three properties:

- the input and output shapes are easy to describe;
- each program instance owns a predictable tile;
- boundary masks are explicit and easy to audit.

== Tiny Checklist

Before treating a Triton kernel as production infrastructure, I would check:

- correctness against a plain PyTorch reference;
- numerical behavior across representative dtypes;
- launch configuration sensitivity, especially block size and number of warps;
- memory access pattern, including coalescing and unnecessary reloads;
- benchmark stability across warmup and repeated runs.

== Takeaway

For AI infrastructure notes, the useful unit is often a checklist plus a reproducible experiment. The checklist keeps the engineering judgment visible, while the experiment gives future readers something concrete to rerun.
