---
name: build-query
description: "Translate a product question into a safe, reproducible query using an available database, warehouse, analytics interface, CLI, MCP, API, or local dataset. Use when a PM needs quantified evidence and the required answer is not available from a standard report."
---

# Build Query

<!-- CORE:BEGIN -->
## Contract

- Require the business question, metric definition, entity grain, absolute period, segment, expected output, source ID, and allowed query scope.
- Verify executable source readiness, read authorization, schema authority, identity mappings, exclusions, resource limits, and timezone before execution. A user-reported prior test alone does not authorize execution.
- For longitudinal account- or workspace-grain queries, require a confirmed stable cohort identity, cohort-assignment time, and task-critical merge/split treatment.
- When access is missing, produce an annotated draft only if confirmed schemas exist. Block execution and never invent tables, columns, or joins.
- Save the query and validation method, then emit the shared evidence handoff for reusable results.
<!-- CORE:END -->

## Process

1. Define the business question, metric, grain, segment, time range, and expected output.
2. Discover the available data access and inspect relevant schemas or examples.
3. Resolve metric definitions and entity relationships before writing the query.
4. Identify test, internal, deleted, duplicate, or otherwise excluded records.
5. Prefer read-only, bounded, and resource-conscious queries.
6. Build the query in understandable stages.
7. Check joins, cardinality, denominators, null handling, time zones, and date boundaries.
8. If task-critical merge or split semantics are unresolved, keep execution partial or blocked. If the ambiguity is bounded and non-critical, draft an explicit exclusion of ambiguous entities and a sensitivity variant rather than choosing attribution silently.
9. Run only when access and authorization permit through a currently addressable, agent-observed source.
10. Validate the result using totals, samples, or a second calculation.
11. Save the query or reproducible method in the project.

Explain assumptions and unresolved schema ambiguity. Never invent columns or silently change the metric definition.

<!-- CORE:BEGIN -->
## Output

Provide the query or reproducible method, parameters, source and schema references, assumptions, safety bounds, validation method and result, unresolved ambiguity, and evidence packet ID when executed.

**Required fields:** Query or method|Parameters|Source and schema references|Assumptions|Safety bounds|Validation method and result|Unresolved ambiguity

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh build-query <artifact>`.
<!-- CORE:END -->
