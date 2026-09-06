---
name: analyze-support-tickets
description: "Analyze recent or scoped support tickets to identify recurring product problems, affected users, severity, workarounds, resolution gaps, and product signals. Use when a PM asks about the latest tickets or tickets related to a module, feature, segment, issue type, tag, queue, or date range."
---

# Analyze Support Tickets

<!-- CORE:BEGIN -->
## Contract

- Require the decision, source ID, allowed queue or record scope, absolute period, product area or topic, segment, deduplication unit, and privacy or retention boundary.
- Verify read authorization and source coverage. If access or classification is partial, analyze only retrieved tickets and label the missing scope.
- Block requests outside the permitted scope and avoid prevalence claims without a defensible customer or account denominator.
- Emit the shared evidence handoff for reusable findings.
<!-- CORE:END -->

## Process

1. Clarify the decision being supported and the requested scope:
   - latest period or explicit date range;
   - module, feature, journey, or product area;
   - user or account segment;
   - queue, tag, category, status, or issue type.
   Resolve relative periods to absolute dates and a timezone.
2. Discover the available ticket access through an MCP, CLI, API, export, or local file.
3. Record the source, retrieval time, filters, and coverage limitations.
4. Remove or flag spam, automated messages, merged duplicates, internal tests, and irrelevant operational tickets where possible.
5. Distinguish ticket count, unique conversations, unique users, and unique accounts.
6. Extract product area, problem type, user goal, severity, frequency, affected segment, workaround, resolution state, recurrence, and potential churn or adoption signal.
7. Group related tickets while preserving important differences between segments and versions.
8. Before comparing periods, record classification or taxonomy changes and raw-to-canonical category mappings. Normalize equivalent categories within each period, report the mapping and per-period normalized counts, and distinguish taxonomy drift from customer-behavior change; do not sum equivalent labels across periods into a spike. If equivalence is uncertain, show the raw counts and mark the trend partial.
9. Identify top patterns, emerging issues, regressions, long-running problems, contradictions, and missing information.
10. Connect ticket signals to usage, data, meetings, or communication evidence when relevant and available.
11. Present evidence and implications to the PM. Do not prioritize the roadmap or modify tickets without explicit direction.
12. Save the analysis using skills/evidence/evidence-handoff.md, then update the relevant project and root work files when the work is meaningful.

<!-- CORE:BEGIN -->
## Output

Provide:

- Scope and source coverage
- Data-cleaning and deduplication notes
- Classification or taxonomy changes and raw-to-canonical mappings used for period comparisons
- Theme table with volume, affected users or accounts, severity, trend, and confidence
- Representative evidence without exposing unnecessary personal data
- Emerging issues and regressions
- Workarounds and resolution gaps
- Product implications and questions for the PM
- Recommended follow-up evidence, clearly labeled as recommendations

Do not interpret ticket volume alone as customer prevalence or product impact.

**Required fields:** Scope and source coverage|Data-cleaning and deduplication notes|Taxonomy changes|Theme table|Representative evidence|Emerging issues|Workarounds and resolution gaps|Implications for the PM|Recommended follow-up evidence

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh analyze-support-tickets <artifact>`.
<!-- CORE:END -->
