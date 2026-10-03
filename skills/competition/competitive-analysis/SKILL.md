---
name: competitive-analysis
description: "Research competitors, substitutes, adjacent products, and the status quo to support product strategy and prioritization. Use for feature comparisons, positioning, market gaps, switching behavior, pricing context, and understanding how users solve the job today."
---

# Competitive Analysis

<!-- CORE:BEGIN -->
## Contract

- Require the PM decision, user job, market boundary, alternatives, comparison dimensions, geography when relevant, and observation date.
- Verify that current primary sources are accessible. Mark unverifiable, stale, paywalled, or inferred claims explicitly.
- If current evidence is unavailable, return a partial research plan rather than a capability or pricing conclusion.
- Emit the shared evidence handoff when findings feed a project workflow.
<!-- CORE:END -->

## Process

1. Define the PM decision, target user, user job, market boundary, and comparison dimensions.
   - For a product manager, the default dimensions are:
     - the user job and its workflow steps
     - target segment
     - onboarding and time to first value as described
     - pricing and plan gates
     - import and migration paths
     - integrations
     - status quo and workarounds
     - release pace
   - Add marketing, sales, or company-finance dimensions only when asked.
2. Include direct competitors, substitutes, internal workarounds, and doing nothing where relevant.
3. Profile any alternatives the user named now. Discover the rest before profiling them, following `skills/evidence/public-research-method.md` from the first search.
   - Search for "alternatives to `<product>`", the precise category, and "`<product>` vs" comparison pages.
   - Propose at most 5. Type each as direct, adjacent, substitute, or status quo, with a reason and a URL.
   - List misfits in an "unknown" bucket with a reason.
   - Wait for the PM to confirm the list. The output at this pause still includes every required field, with the proposed list under Questions for the PM.
4. Gather evidence with `skills/evidence/public-research-method.md`. Prefer current primary sources for product capabilities, pricing, policies, and positioning. Record the method's stop verdict under Gaps.
5. Record the source and observation date.
6. Separate verified facts from interpretation and inference. For each alternative, state what it claims and what is confirmed.
7. Profile every alternative with the same template so profiles compare.
8. Fill each comparison cell with yes, no, partial, unknown, or n/a.
   - Every cell except unknown cites a source.
   - Mark "no" only when a first-party page states the absence. When pages are silent, mark unknown and write "not observed on [pages], as of [date]".
   - Use one as-of date for the whole comparison.
9. When public evidence is thin, narrow the comparison to what the evidence supports.
   - Name the smallest gaps and how to close each one.
   - Treat a documented lack of public information as a finding.
   - Never estimate headcount or funding without a source.
10. On a rerun, report what changed first: then, now, and confidence.
11. List leadership only as announced roles.
12. Compare workflows and outcomes, not only feature checklists.
13. Identify parity expectations, meaningful differentiation, underserved needs, and trade-offs.
14. Connect findings to existing customer and product evidence.
15. Present strategic options and questions for the PM.

Never declare a winner, rank options, or score threats, whoever is asking. Produce battlecards or talk tracks only when the user asks for them.

<!-- CORE:BEGIN -->
## Output

Provide source coverage and dates, verified comparisons, inferred implications, gaps, trade-offs, questions for the PM, and a shared evidence packet when the work feeds a project.

**Required fields:** Source coverage and dates|Verified comparisons|Inferred implications|Gaps|Trade-offs|Questions for the PM

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh competitive-analysis <artifact>`.
<!-- CORE:END -->
