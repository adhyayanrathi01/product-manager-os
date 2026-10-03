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
2. Check the project for existing evidence packets. Reuse matching packets instead of retrieving or recounting the same raw sources. Keep a reused packet's deduplication unit, and mark any unit it lacks as not counted.
3. Minimize personal data and preserve source references. Use pseudonymous IDs, never person names. Treat account names according to the privacy boundary.
4. For public reviews and forums:
   - Follow `skills/evidence/public-research-method.md` through its "Before output" steps.
   - Report source skew before themes: who writes on each platform, and review-campaign signals such as a tight date cluster, uniformly high ratings, or very short reviews.
   - Exclude flagged campaign records from author counts and theme evidence, and list them by ID under Risks of bias.
   - Reviews show customer language, not how common a problem is.
5. Extract evidence units: observed behavior, stated need, pain, workaround, desired outcome, objection, trigger, outcome, and consequence for the user.
   - For a product manager, also record the product area, funnel stage, and segment (role, company size, or plan) where stated.
   - Never infer a higher evidence level from a lower one. From lowest to highest, the levels are pain, workaround, accepts a solution, and pays or keeps using.
6. Apply a codebook the user can see. Version it in the project when one is active; otherwise show it in the output. Mark any new code as proposed. Group by underlying need, not by feature, without erasing meaningful differences between segments.
7. Count three units separately: records, independent authors or accounts, and incidents.
   - Keep a reversible independence table. It covers the same record ID, cross-posts, the same author with a new incident, similar text from an unknown author, and affiliate copies. Mark each row independent or not.
   - Treat one platform as one source family. Report authors per platform, and note in Confidence a theme seen on only one platform.
   - Report each unit as n of N in that same unit, from what was actually processed, never as a share of all users.
8. Report a theme only with at least 3 independent authors or accounts. Put fewer in a weak-signal list, unless a small-sample exception states the count and why the sample is small.
   - Label each theme recurring, concentrated, or isolated.
   - Identify strong patterns, weak signals, contradictions, outliers, and missing voices.
   - List counterexamples by ID. "No material problem found" is a valid result.
9. Use short quotes only when permitted and necessary. Keep them word for word, at most 2 sentences, and checked against the source. Label paraphrase as paraphrase. Never invent or polish quotes into different claims.
10. Connect themes to quantitative or product evidence when available.
11. Present implications and open questions, not an automatic product decision. Show consequence in its own column of the themes table, and leave ranking to the PM or user.

<!-- CORE:BEGIN -->
## Output

Provide source coverage, themes, evidence examples, affected segments, confidence, contradictions, risks of bias, and implications for the PM.

**Required fields:** Source coverage|Themes|Evidence examples|Affected segments|Confidence|Contradictions|Risks of bias|Implications for the PM

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh analyze-customer-evidence <artifact>`.
<!-- CORE:END -->
