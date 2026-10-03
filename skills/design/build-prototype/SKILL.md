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
   - Tie the learning goal to a user behavior or a product metric.
   - Set pass and fail thresholds and a disposal plan before building, and record them under Test scenario.
   - Test one hypothesis per prototype.
2. Read the relevant project evidence and acceptance criteria.
3. Locate the existing design system, product patterns, and brand guidance. Prefer reuse, then compose, then extend, then create, then feature-local. When the system cannot be verified, label design choices conditional.
4. State assumptions when required context is missing.
5. Choose the lowest-fidelity prototype that can answer the learning question. Do not fake the dimension being tested:
   - A question about how something looks needs a rendered result.
   - A question about how something behaves needs something the user can drive.
6. Match variants to the question. A single approved direction gets one build unless the PM asks for variants.
   - A narrow question gets 2 or 3 close variants.
   - A wide question gets 3 to 5 structurally different options, in a table with "when it is right" and "its cost". Present the table and build only what the PM picks.
   - "Neither" and "skip the prototype" are valid outcomes. The PM chooses.
7. Build the core path, important states, errors, permissions, and role differences.
   - Map states by transition, and cover the reachable ones, including error states and the longest realistic value.
   - Empty has three designs: never had data, filtered to zero, and cleared by the user.
8. Show a visible "Sample data" label, and list synthetic values under Assumptions. Never show real-looking testimonials or logos, or any metric without that label. When asked for impressive numbers, explain that they would bias the test, propose labeled sample values, and let the PM choose. Use neutral styling or the existing design system unless the question is about visuals.
9. Keep the prototype separate from production unless explicitly authorized. Never promote a prototype to production.
10. Check only what the question puts in play: contrast of at least 4.5:1 for body text and 3:1 for large text and controls, visible focus, and states shown with the shortest and longest realistic values. Always add feasibility notes for engineering.
    - Render at 375 and 1280 wide when a renderer is available, in at most 3 rounds, with one fix batch per round.
    - Never install a renderer. When nothing renders, report confidence as partial.
    - Mark each finding reproduced, not reproduced, or unknown. A skipped check is not a pass.
    - Without a measuring tool, report contrast as unknown and quote no ratio, measured or target.
    - Label any AI critique an expert-review hypothesis, not user evidence.
11. Prepare a test scenario and concise handoff notes for engineering.
12. Link the prototype and findings from the project and index.md.

Do not treat a prototype as the PM’s final decision or as production-ready by default.

<!-- CORE:BEGIN -->
## Output

Provide the prototype pointer, covered personas and states, assumptions, accessibility and feasibility notes, test scenario, acceptance coverage, and explicit production-readiness limitations.

**Required fields:** Prototype pointer|Covered personas and states|Assumptions|Accessibility and feasibility notes|Test scenario|Acceptance coverage|Production-readiness limitations

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh build-prototype <artifact>`.
<!-- CORE:END -->
