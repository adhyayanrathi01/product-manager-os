---
name: analyze-customer-evidence
description: "Synthesize interviews, meeting notes, support tickets, surveys, sales conversations, reviews, and other qualitative evidence. Use when a PM needs recurring needs, pains, jobs, objections, behavioral context, churn signals, or evidence for a product decision."
---

# Analyze Customer Evidence

<!-- CORE:BEGIN -->
## Contract

- Require the decision, source IDs, permitted scope, user segments, absolute period, deduplication unit, and privacy or retention boundary.
- Verify source coverage and reuse matching evidence packets before retrieving raw material.
- When sampling or permissions are partial, report bounded themes and missing voices; block prevalence claims unsupported by independent coverage.
- Emit the shared evidence handoff for reusable findings.
<!-- CORE:END -->

## Process

1. Define the decision, user group, evidence sources, date range, and known sampling limitations.
2. Check the project for existing evidence packets. Reuse matching packets instead of retrieving or recounting the same raw sources.
3. Minimize personal data and preserve source references.
4. Extract evidence units: observed behavior, stated need, pain, workaround, desired outcome, objection, trigger, and outcome.
5. Group related evidence without erasing meaningful differences between segments.
6. Count source coverage carefully; do not treat repeated comments from one source as independent users.
7. Identify strong patterns, weak signals, contradictions, outliers, and missing voices.
8. Use short quotes only when permitted and necessary; never invent or polish quotes into different claims.
9. Connect themes to quantitative or product evidence when available.
10. Present implications and open questions, not an automatic product decision.

<!-- CORE:BEGIN -->
## Output

Provide source coverage, themes, evidence examples, affected segments, confidence, contradictions, risks of bias, and implications for the PM.

**Required fields:** Source coverage|Themes|Evidence examples|Affected segments|Confidence|Contradictions|Risks of bias|Implications for the PM

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh analyze-customer-evidence <artifact>`.
<!-- CORE:END -->
