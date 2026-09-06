---
name: create-tracking-plan
description: "Define or revise a provider-neutral product analytics tracking plan. Use when a PM needs events, properties, identities, success metrics, test-account handling, instrumentation requirements, or measurement acceptance criteria for a feature or flow."
---

# Create Tracking Plan

<!-- CORE:BEGIN -->
## Contract

- Require an approved or explicitly exploratory product goal, user flow, actor or entity model, measurement questions, and privacy constraints.
- Verify existing event and naming sources when available. Mark the plan partial when identity, exclusions, ownership, or validation environment is unresolved.
- Output a reviewable plan and acceptance checks. Do not create events or mutate instrumentation without explicit authorization.
<!-- CORE:END -->

## Process

1. Read the approved product goal, user flow, and measurement question.
2. Inspect the existing event dictionary and naming conventions when available.
3. Reuse existing events when they accurately represent the behavior.
4. Define each required event with:
   - name;
   - business question;
   - exact trigger;
   - actor or identity;
   - required properties;
   - optional properties;
   - source surface;
   - validation method.
5. Define user-identity and anonymous-to-known behavior.
6. Define how test, employee, bot, demo, and internal activity is marked or excluded.
7. Check for ambiguous names, duplicate events, sensitive properties, and excessive collection.
8. Present the tracking plan for PM and engineering review.
9. Create or modify events through an available tool only when the user explicitly requests execution.
10. Add post-implementation validation criteria.

<!-- CORE:BEGIN -->
## Output

Provide a tracking table plus open questions, risks, ownership, and acceptance checks. Keep the plan independent of a specific analytics provider unless the user asks for provider-specific instructions.

**Required fields:** Tracking table|Open questions|Risks|Ownership|Acceptance checks

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh create-tracking-plan <artifact>`.
<!-- CORE:END -->
