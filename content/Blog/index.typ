#import "../index.typ": template, tufted
#show: template.with(
  title: "Article Archive",
  description: "Technical articles and reusable references organized by the current technical writing taxonomy.",
)

#html.elem(
  "div",
  attrs: (id: "quick-index", class: "quick-index"),
  {
    html.elem("strong", "Quick Index")
    html.elem("a", attrs: (href: "#ai-infra"), "AI Infra")
    html.elem("a", attrs: (href: "#data-curation"), "Data curation")
    html.elem("a", attrs: (href: "#math"), "Math")
    html.elem("a", attrs: (href: "#rl"), "RL")
    html.elem("a", attrs: (href: "#opd"), "OPD")
    html.elem("a", attrs: (href: "#agent"), "Agent")
    html.elem("a", attrs: (href: "#tech-report-analysis"), "Tech Report Analysis")
    html.elem("a", attrs: (href: "#project-management-experience"), "Project Management Experience")
    html.elem("a", attrs: (href: "#timeline"), "Timeline")
  },
)

#html.elem("h2", attrs: (id: "ai-infra"), "AI Infra")

Training and inference infrastructure notes: kernels, distributed training, serving runtimes, performance engineering, and framework internals.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
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
  title: "Triton Kernel Smoke Test",
  category: "AI Infra",
  tags: ("triton", "kernel", "performance"),
  description: "A short AI infrastructure note that checks whether the blog taxonomy, archive entry, and build pipeline work for a Triton topic.",
)

#html.elem("h2", attrs: (id: "data-curation"), "Data curation")

Data pipeline notes for model training and evaluation: mixture design, selection criteria, filtering rules, quality checks, and feedback loops.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
    html.span(class: "blog-entry-tag", "Data Mixture")
    html.span(class: "blog-entry-tag", "Data Selection")
    html.span(class: "blog-entry-tag", "Data Filtering")
  },
)

#html.p(class: "blog-entry-description", "No published articles yet. New posts should use category Data curation and put the matching subcategory as the first tag when applicable.")

#html.elem("h2", attrs: (id: "math"), "Math")

Matrix calculus, linear algebra, and optimization notes: trace techniques, matrix derivatives, backpropagation derivations, and numerical linear algebra.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
    html.span(class: "blog-entry-tag", "Matrix Calculus")
    html.span(class: "blog-entry-tag", "Linear Algebra")
    html.span(class: "blog-entry-tag", "Optimization")
  },
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 7),
  path: "2026-06-07-matrix-calculus/",
  title: "Matrix Calculus via Trace Techniques and MLP Backpropagation",
  category: "Math",
  tags: ("Matrix Calculus", "Backpropagation"),
  description: "A self-contained derivation of matrix derivatives using trace tricks, applied to the full backward pass of a multi-layer perceptron.",
)

#html.elem("h2", attrs: (id: "rl"), "RL")

Reinforcement learning notes: algorithms, reward design, evaluation, training stability, and practical experiment records.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
    html.span(class: "blog-entry-tag", "TBD")
  },
)

#html.p(class: "blog-entry-description", "No published articles yet. Subcategories will be added once the RL writing stream stabilizes.")

#html.elem("h2", attrs: (id: "opd"), "OPD")

OPD notes are reserved as their own workstream so the archive can grow without mixing them into broader AI infrastructure or RL categories.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
    html.span(class: "blog-entry-tag", "TBD")
  },
)

#html.p(class: "blog-entry-description", "No published articles yet. Subcategories are intentionally left blank for now.")

#html.elem("h2", attrs: (id: "agent"), "Agent")

Agent system notes: tool use, memory, planning, evaluation, product loops, and infrastructure needed to make agents useful in practice.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
    html.span(class: "blog-entry-tag", "TBD")
  },
)

#html.p(class: "blog-entry-description", "No published articles yet. Subcategories will be added after several posts make the natural grouping clearer.")

#html.elem("h2", attrs: (id: "tech-report-analysis"), "Tech Report Analysis")

Technical report analysis for mainstream open model families: architecture, training data, post-training methods, evaluation results, efficiency choices, and deployment implications.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
    html.span(class: "blog-entry-tag", "DeepSeek")
    html.span(class: "blog-entry-tag", "MiniMax")
    html.span(class: "blog-entry-tag", "MiMo")
    html.span(class: "blog-entry-tag", "GLM")
    html.span(class: "blog-entry-tag", "Qwen")
    html.span(class: "blog-entry-tag", "OLMo")
    html.span(class: "blog-entry-tag", "Other Open Models")
  },
)

#html.p(class: "blog-entry-description", "No published articles yet. New posts should use category Tech Report Analysis and put the model family as the first tag when applicable.")

#html.elem("h2", attrs: (id: "project-management-experience"), "Project Management Experience")

Project management notes from real work: goal alignment, scope control, execution cadence, stakeholder communication, delivery risk, and retrospective practices.

#html.div(
  class: "quick-index",
  {
    html.elem("strong", "Subcategories")
    html.span(class: "blog-entry-tag", "Planning")
    html.span(class: "blog-entry-tag", "Execution")
    html.span(class: "blog-entry-tag", "Retrospective")
  },
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 9),
  path: "2026-06-09-project-management-experience/",
  title: "Project Management Notes: From Goal Alignment to Delivery Review",
  category: "Project Management Experience",
  tags: ("Planning", "Execution", "Retrospective"),
  description: "A practical example note on turning vague project goals into aligned scope, execution cadence, risk management, and reusable delivery review.",
)

#html.elem("h2", attrs: (id: "timeline"), "Timeline")

== 2026

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 9),
  path: "2026-06-09-project-management-experience/",
  title: "Project Management Notes: From Goal Alignment to Delivery Review",
  category: "Project Management Experience",
  tags: ("Planning", "Execution", "Retrospective"),
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 4),
  path: "2026-06-04-triton-kernel-smoke-test/",
  title: "Triton Kernel Smoke Test",
  category: "AI Infra",
  tags: ("triton", "kernel", "performance"),
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 7),
  path: "2026-06-07-matrix-calculus/",
  title: "Matrix Calculus via Trace Techniques and MLP Backpropagation",
  category: "Math",
  tags: ("Matrix Calculus", "Backpropagation"),
)

== 2025

#tufted.blog-entry(
  date: datetime(year: 2025, month: 10, day: 30),
  path: "2025-10-30-normal-distribution/",
  title: "Normal Distribution",
  category: "Example / Legacy",
  tags: ("Statistics", "Probability distribution"),
)
#tufted.blog-entry(
  date: datetime(year: 2025, month: 4, day: 16),
  path: "2025-04-16-monkeys-apes",
  title: "Monkeys vs Apes",
  category: "Example / Legacy",
  tags: ("Concept comparison",),
)

== 2024

#tufted.blog-entry(
  date: "2024-10-04",
  path: "2024-10-04-iterators-generators/",
  title: "Iterators vs Generators in Python",
  category: "Example / Legacy",
  tags: ("Python", "Generators"),
)
