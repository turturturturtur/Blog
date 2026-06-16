#import "../index.typ": template, tufted
#show: template.with(
  title: "Project Management Notes: From Goal Alignment to Delivery Review",
  description: "A practical example note on turning vague project goals into aligned scope, execution cadence, risk management, and reusable delivery review.",
  date: datetime(year: 2026, month: 6, day: 9),
  lang: "en",
  extra-info: [Project Management Experience · Planning · Execution · Retrospective],
)

= Project Management Notes: From Goal Alignment to Delivery Review

Good project management is not about making a beautiful plan. It is about making the work legible early enough that the team can decide, execute, adjust, and review without relying on memory or heroic coordination.

This example note uses a typical engineering project as the reference case: a team needs to deliver a new internal tool within one month while coordinating product, engineering, data, and operations stakeholders.

== Practical Takeaway

Start every project by writing down the decision the project exists to support, the scope that is explicitly included, and the risks that would force a reset. Then run the project with a lightweight cadence: weekly milestones, short status updates, visible blockers, and a final review that turns experience into reusable material.

The management artifact does not need to be long. It needs to answer four questions:

- What outcome are we trying to change?
- What is in scope, and what is deliberately out of scope?
- What can block delivery or make the result useless?
- What did we learn that should change the next project?

== Goal Alignment

The first failure mode is mistaking activity for alignment. A project can have tickets, meetings, and a timeline while still missing a shared definition of success.

For the example internal tool, the goal should not be written as "build a dashboard." That describes the artifact, not the outcome. A better goal is:

#quote[
  Reduce the time operations spends checking daily data quality from two hours to fifteen minutes, while making failures visible to engineering within the same business day.
]

This form is useful because it names the user, the current pain, the expected improvement, and the response loop. Once the goal is written this way, scope discussions become much easier.

== Scope and Milestones

Scope should be split into three groups:

- *Must ship*: the smallest set of functions needed for the project to count as useful.
- *Should ship*: improvements that matter, but can be delayed without invalidating the project.
- *Not now*: reasonable ideas that are explicitly excluded to protect delivery.

For the internal tool, a reasonable split is:

- Must ship: daily data quality status, owner assignment, alert history, and manual acknowledgement.
- Should ship: trend charts, saved filters, and Slack notification tuning.
- Not now: automated repair, permission redesign, and historical backfill beyond thirty days.

Milestones then become checkpoints for decision quality, not just date labels:

- Week 1: confirm the operating workflow and agree on the minimum useful surface.
- Week 2: ship a thin vertical slice with real data and one owner.
- Week 3: handle edge cases, alerts, and basic observability.
- Week 4: run a pilot, capture feedback, and decide whether to expand.

== Execution Cadence

Cadence is the mechanism that keeps the project honest. It should be predictable enough that stakeholders know when to look, but light enough that the team still spends most of its time building.

A practical cadence for a one-month project:

- Monday: milestone target and risk check.
- Wednesday: blocker review and scope adjustment.
- Friday: status note with progress, decisions, risks, and next actions.

The status note should be short. A useful format is:

#quote[
  This week we completed X, learned Y, and are blocked by Z. The current delivery risk is low / medium / high because [...]. Next week we will focus on [...]
]

The point is not reporting for its own sake. The point is creating a shared external memory so decisions do not vanish into chat history.

== Risk Management

Risk management starts when the project begins, not when the project is late. The most useful risks are concrete enough to trigger action.

Weak risk: "data may be messy."

Useful risk: "if more than 10% of daily jobs have missing owner metadata, the acknowledgement workflow cannot route failures, so Week 2 must include an owner coverage audit."

Good risk statements include condition, impact, and response:

- *Condition*: what might happen?
- *Impact*: why does it matter?
- *Response*: what will we do if it happens?

For small projects, three to five active risks are enough. If the list becomes longer, the team is probably tracking anxiety rather than managing delivery.

== Delivery Review

The final review should not be a ceremonial meeting. It should turn the project into reusable experience.

Review four things:

- Outcome: did the project change the metric or workflow it was meant to change?
- Scope: what was cut, added, or misunderstood?
- Process: which cadence, communication, or ownership choices helped or hurt?
- Reuse: what templates, checks, or decisions should be reused next time?

For the example tool, a useful review might say:

#quote[
  The pilot reduced daily quality checks from two hours to twenty minutes, but owner metadata coverage blocked full automation. For the next project, data ownership coverage must be validated before UI work starts.
]

That sentence is more valuable than a long report because it preserves the decision rule for the next project.

== Example Checklist

Before starting:

- Write the outcome in user and workflow terms.
- Define must ship, should ship, and not now.
- Name one directly responsible owner for each workstream.
- List the top risks with condition, impact, and response.

During execution:

- Keep milestone notes visible.
- Record decisions where future readers can find them.
- Revisit scope whenever a risk becomes real.
- Use status updates to clarify decisions, not to narrate activity.

After delivery:

- Compare intended outcome with actual result.
- Record what changed in scope and why.
- Save reusable templates, queries, dashboards, or decision rules.
- Write the one lesson that should shape the next project.

== Closing

Project management experience becomes valuable only when it is specific. "Communicate more" is too vague to reuse. "Validate data owner coverage before UI work starts" is specific enough to change future behavior.

That is the standard this category should aim for: not generic management advice, but concrete operating notes that make the next project easier to run.
