#import "../config.typ": template, tufted
#show: template.with(
  title: "An Ordinary Yellow Peach's Blog",
  description: "Notes on AI infrastructure, data curation, math, RL, OPD, agents, project management experience, and reusable engineering references.",
)

#tufted.margin-note[
  This site keeps the Tufte-style wide margin: the main column carries the argument, while margin notes hold context, reminders, and indexes without interrupting the reading flow.
]

#tufted.margin-note[
  Planned writing flow: collect drafts in Lark or another writing tool, shape them into Typst articles, validate the local build, then publish through GitHub Actions.
]

= An Ordinary Yellow Peach's Blog

This is a personal technical blog for long-term notes, reusable references, and engineering retrospectives. It is not a template landing page; it is where I keep material that should remain useful after the first read: how a problem was decomposed, how a concept was checked, and what practice exposed.

#figure(caption: "A Tufte-style reading and writing layout")[#image("imgs/devices.webp")]

== Reading Entrypoints

#tufted.full-width[
  #html.div(
    class: "topic-grid",
    {
      html.elem(
        "a",
        attrs: (class: "topic-card", href: "Blog/"),
        {
          html.elem("strong", "Article Archive")
          html.p("Technical articles organized by the current taxonomy, year, and tag.")
        },
      )
      html.elem(
        "a",
        attrs: (class: "topic-card", href: "Blog/#quick-index"),
        {
          html.elem("strong", "Quick Index")
          html.p("Fast entrypoints for common concepts, toolchains, and practical references.")
        },
      )
      html.elem(
        "a",
        attrs: (class: "topic-card", href: "feed.xml"),
        {
          html.elem("strong", "RSS Feed")
          html.p("Subscribe to follow new articles as they are published.")
        },
      )
    },
  )
]

== Why Keep The Tufte Style

The Tufte style fits technical writing well: the main column carries the continuous explanation, while the margin holds supporting notes, figure explanations, and side references. An article can be read in order, and later scanned quickly for the important reminders.

I will try to keep that habit here: titles should name the topic directly, openings should give the conclusion and use case, bodies should preserve the reasoning and practice, and margin notes should hold the references and reminders that do not belong in the main flow.

== Topics

- *AI Infra*: triton, c++, megatron, verl, vllm, slime, sglang, distributed training, inference serving, and performance engineering.
- *Data curation*: Data Mixture, Data Selection, Data Filtering, quality checks, and training data feedback loops.
- *Math*: matrix calculus, linear algebra, optimization notes, trace techniques, matrix derivatives, and backpropagation derivations.
- *RL*: reinforcement learning algorithms, reward design, evaluation, stability, and experiment notes.
- *OPD*: an independent workstream kept separate until its subcategories become stable.
- *Agent*: tool use, memory, planning, evaluation, product loops, and the infrastructure around practical agent systems.
- *Project Management Experience*: planning, execution cadence, cross-team communication, delivery risk, and review notes.

== Writing And Publishing Workflow

For new articles, the recommended workflow is:

1. Write the raw material in Lark or another drafting tool.
2. Shape the draft into a structured article with title, summary, category, tags, and references.
3. Generate `content/Blog/YYYY-MM-DD-topic-name/index.typ`.
4. Run `uv run build.py build -f` to validate the site.
5. Commit and push to GitHub so GitHub Pages can deploy it.
