---
name: test-product-flow
description: "Test a product flow against acceptance criteria across relevant personas, roles, environments, and states. Use for prototype validation, regression checks, exploratory testing, role-based access, instrumentation verification, or PM acceptance testing."
---

# Test Product Flow

<!-- CORE:BEGIN -->
## Contract

- Require the project acceptance criteria, environment, persona names, permitted actions, test scope, and evidence-retention boundary.
- Resolve persona credentials through the environment-variable names configured in context.md; do not assume fixed roles.
- Verify browser or test readiness and confirm that the flow cannot affect real users or production data beyond the approved scope.
- If a persona or environment is unavailable, test only ready coverage and report it as partial. Block unsafe or unauthorized execution.
- Output reproducible cases, evidence pointers, coverage, failures, and untested areas.
<!-- CORE:END -->

## Process

1. Read the project goal, selected direction, acceptance criteria, and relevant user roles.
2. Read arbitrary QA persona definitions and credential environment-variable names from context.md; read secret values from the environment only.
3. Discover the available browser or test capability. Prefer repeatable Playwright CLI flows when configured.
4. Test the critical path, alternate states, permissions, errors, empty states, and recovery.
5. Verify important analytics behavior when observable.
6. Capture reproducible evidence without exposing credentials or personal data.
7. Distinguish confirmed defects, usability concerns, instrumentation gaps, and untested areas.
8. Report severity, affected role, reproduction steps, expected behavior, and actual behavior.
9. Do not deploy fixes or change production without explicit approval.
10. Save reusable test cases or findings in the project.

Stop and report when a test could affect production data or real users.

<!-- CORE:BEGIN -->
## Output

Provide tested environment and personas, coverage, reproducible cases, expected and actual behavior, severity, evidence pointers, instrumentation observations, untested areas, and blockers.

**Required fields:** Tested environment and personas|Coverage|Reproducible cases|Expected and actual behavior|Severity|Evidence pointers|Untested areas|Blockers

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh test-product-flow <artifact>`.
<!-- CORE:END -->
