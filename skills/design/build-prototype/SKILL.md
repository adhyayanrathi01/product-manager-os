---
name: build-prototype
description: "Create a testable product prototype from a PM-approved direction, hypothesis, or explicitly requested exploration. Use when a team needs to visualize a flow, test an interaction, apply an existing design system, or prepare a clearer engineering handoff."
---

# Build Prototype

<!-- CORE:BEGIN -->
## Contract

- Require a PM-approved direction or explicitly requested exploration, target persona, scenario, learning goal, constraints, and acceptance criteria.
- Verify design-system access, destination, permitted fidelity, and whether any environment is production-connected.
- If design context is incomplete, produce only a clearly labeled partial or low-fidelity exploration. Block production changes without explicit authorization.
- Output the prototype pointer, covered states, assumptions, test scenario, and handoff limitations.
<!-- CORE:END -->

## Process

1. Confirm the selected direction, hypothesis, target users, scenario, and learning goal.
2. Read the relevant project evidence and acceptance criteria.
3. Locate the existing design system, product patterns, and brand guidance.
4. State assumptions when required context is missing.
5. Choose the lowest-fidelity prototype that can answer the learning question.
6. Build the core path, important states, errors, permissions, and role differences.
7. Keep the prototype separate from production unless explicitly authorized.
8. Review accessibility, responsiveness, consistency, and feasibility.
9. Prepare a test scenario and concise handoff notes.
10. Link the prototype and findings from the project and index.md.

Do not treat a prototype as the PM’s final decision or as production-ready by default.

<!-- CORE:BEGIN -->
## Output

Provide the prototype pointer, covered personas and states, assumptions, accessibility and feasibility notes, test scenario, acceptance coverage, and explicit production-readiness limitations.

**Required fields:** Prototype pointer|Covered personas and states|Assumptions|Accessibility and feasibility notes|Test scenario|Acceptance coverage|Production-readiness limitations

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh build-prototype <artifact>`.
<!-- CORE:END -->
