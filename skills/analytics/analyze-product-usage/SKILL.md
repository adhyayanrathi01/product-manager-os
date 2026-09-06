---
name: analyze-product-usage
description: "Analyze product behavior using whatever analytics, database, CLI, MCP, API, or file access is available. Use for funnels, cohorts, retention, activation, engagement, adoption, conversion, segmentation, and feature-usage investigations."
---

# Analyze Product Usage

<!-- CORE:BEGIN -->
## Contract

- Require a decision or question, metric behavior, entity grain, segment, absolute period, comparison, and source scope.
- Before calculating, verify executable source readiness, event semantics, identity mappings, exclusions, timezone, and outcome-window maturity. A user-reported smoke test without a currently addressable, agent-observed bounded read is not executable readiness.
- For longitudinal account- or workspace-grain metrics, require a confirmed stable cohort identity, cohort-assignment time, and task-critical merge/split treatment.
- If definitions or access are incomplete, return a partial analysis plan and exact gaps. Do not publish a numerical finding when its denominator, grain, join, or maturity rule is unresolved.
- Save the reproducible method and emit skills/evidence/evidence-handoff.md for reusable findings.
<!-- CORE:END -->

## Process

1. Restate the product question and decision being supported.
2. Confirm the metric definition, user segment, time range, comparison, and unit of analysis.
3. Read test and internal-account definitions from context.md.
4. Discover available data access and inspect event definitions or schemas before analysis.
5. Exclude test, employee, bot, demo, duplicate, and known invalid activity when definitions exist. State any exclusion that cannot be applied.
6. Run the smallest analysis that can answer the question. Expand only when the initial result reveals a useful follow-up.
7. Validate denominators, identity behavior, event completeness, time zones, missing data, cohort maturity or right-censoring, sample size, and practical significance.
8. If merge or split ambiguity is task-critical, stop numerical publication and return partial or blocked with the exact decision needed. If it is bounded and non-critical, exclude ambiguous entities, disclose the exclusion, and compare a sensitivity result where feasible.
9. Separate measured behavior from causal interpretation.
10. Save reproducible filters, queries, or steps in the project.

<!-- CORE:BEGIN -->
## Output

Report:

- Question and definitions
- Source, date range, segment, and exclusions
- For every cohort or retention result: absolute cohort-entry dates and timezone; outcome window; maturity cutoff or as-of rule; grain and identity-deduplication rule; and counts of applied, excluded by reason (including test/demo), and unmapped records
- Findings with supporting values
- Data-quality limitations
- Plausible interpretations
- Follow-up evidence needed
- Implications and options for the PM
- Evidence packet ID and reproducible artifact pointer

Do not claim causality from correlation alone.

**Required fields:** Question and definitions|Source and scope|Cohort accounting|Findings|Data-quality limitations|Interpretations|Follow-up evidence|Implications for the PM|Evidence packet ID

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh analyze-product-usage <artifact>`.
<!-- CORE:END -->
