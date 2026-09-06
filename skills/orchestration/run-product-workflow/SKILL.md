---
name: run-product-workflow
description: "Coordinate an evidence-backed product investigation from an ambiguous product question to a structured decision brief. Use when a PM asks to improve retention, activation, engagement, conversion, adoption, satisfaction, or another product outcome and the work requires multiple evidence sources or skills."
---

# Run Product Workflow

<!-- CORE:BEGIN -->
## Contract

- Require the PM decision, desired outcome, target users, scope, success measure, time interpretation, and task-relevant readiness from context.md.
- Start when at least one decision-relevant source is executable-ready or a supplied artifact is readable and agent-observed. A user-reported prior smoke test alone is insufficient. Return a partial brief when useful evidence exists; return blocked when no evidence can support the decision.
- For longitudinal account- or workspace-grain decisions, require stable cohort identity, assignment time, and task-critical merge/split treatment. Keep synthesis partial or blocked while these are unresolved; use explicit exclusion and sensitivity bounds only when the ambiguity is non-critical and bounded.
- Delegate only bounded, independent tracks when isolation or parallelism improves coverage or reduces orchestrator context. Keep sequential reasoning, PM decisions, and shared-state integration with the orchestrator.
- Give each worker one objective, explicit scope and permissions, only the necessary context, acceptance checks, and a concise output contract. Assign non-overlapping writes; workers do not update shared root or project state.
- Require delegated evidence tracks to reuse matching packets and return conclusions, evidence pointers, uncertainty, changed files, and verification through the shared evidence handoff—not raw transcripts or long logs. The orchestrator alone integrates accepted results.
- Output a decision brief and stop at the PM checkpoint before implementation or external mutation.
<!-- CORE:END -->

## Process

1. Clarify the decision the PM needs to make, desired outcome, affected experience, target users, scope, and success measure.
2. Create or select a project folder and start from projects/_template/project.md.
3. Read only the relevant context and source pointers.
4. Check the project for existing evidence packets. Consume matching packets instead of rerunning or recounting the same raw sources unless validating a known gap or refreshing stale evidence.
5. Plan the smallest useful evidence set across:
   - product usage or metrics;
   - support tickets;
   - meetings and team communications;
   - other customer and stakeholder evidence;
   - competitive alternatives;
   - product, design, or technical context.
6. Select evidence in this order: the source that measures the outcome, the closest source that can explain user or product context, then a contradictory or validating source. Expand only when the current evidence cannot distinguish material hypotheses, has a known coverage gap, or is stale for the decision.
7. Stop gathering when additional evidence is unlikely to change the option set, confidence, or next validation step. Record the stopping reason.
8. Discover available tools and sources. State important evidence gaps rather than blocking all progress.
9. Use the minimum useful number of subagents for eligible tracks. Stop delegating when another track is unlikely to change the option set, confidence, risk, or next validation step.
10. Synthesize the evidence without collapsing distinctions between:
   - observed facts;
   - interpretations;
   - causal hypotheses;
   - unknowns.
11. Present plausible problems and opportunity options.
12. Stop for the PM’s decision before creating events, changing a product, building a prototype, deploying, or making external changes.
13. Update the project, task.md, log.md, and index.md.

For a narrow request involving only tickets, meetings, or communications, invoke the relevant standalone skill without forcing the full multi-source workflow.

<!-- CORE:BEGIN -->
## Output

Produce a decision brief containing:

- Decision to support
- Executive summary
- Evidence reviewed and gaps
- Observed findings
- Plausible causes with supporting and contradicting evidence
- Options for the PM
- Expected impact, trade-offs, risks, confidence, and validation for each option
- Questions the PM must decide
- Recommended next evidence or experiment, clearly labeled as a recommendation

Do not select the final product direction unless the PM explicitly asks for a recommendation, and even then preserve the decision checkpoint.

**Required fields:** Decision to support|Executive summary|Evidence reviewed and gaps|Observed findings|Plausible causes|Options for the PM|Trade-offs and confidence|Questions the PM must decide|Recommended next evidence

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh run-product-workflow <artifact>`.
<!-- CORE:END -->
