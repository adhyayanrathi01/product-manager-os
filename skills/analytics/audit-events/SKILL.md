---
name: audit-events
description: "Audit existing product analytics events for correctness, completeness, consistency, identity handling, and analysis readiness. Use when instrumentation seems unreliable, metrics disagree, a feature lacks visibility, or a team wants to verify tracking before analysis."
---

# Audit Events

<!-- CORE:BEGIN -->
## Contract

- Require the decision or product flow, expected instrumentation, observed source scope, environment, and permission boundary.
- Verify source readiness, event dictionary authority, identity rules, exclusions, and whether product-flow sampling is permitted.
- Without observed data or flow access, provide a partial documentation audit and name what remains unverified; do not claim runtime correctness.
- Emit a reusable evidence packet when the audit informs a broader investigation.
<!-- CORE:END -->

## Process

1. Identify the product flow and decisions the instrumentation must support.
2. Gather the expected tracking plan, current event dictionary, and observed event data.
3. Check event triggers, naming, property types, required fields, identity rules, ordering, duplication, and version drift.
4. Check whether test, employee, bot, demo, and internal activity can be identified.
5. Compare expected coverage with observed coverage.
6. Sample important events against the real product flow when access permits.
7. Classify issues by severity and the decisions they could distort.
8. Recommend the smallest corrections and validation plan.
9. Do not modify instrumentation without explicit approval.

<!-- CORE:BEGIN -->
## Output

List confirmed coverage, gaps, data-quality risks, affected analyses, recommended fixes, and verification steps.

**Required fields:** Confirmed coverage|Gaps|Data-quality risks|Affected analyses|Recommended fixes|Verification steps

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh audit-events <artifact>`.
<!-- CORE:END -->
