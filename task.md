# Current task

## Goal

Ship v0.4.0 guarded self-improvement: immutable core regions, origin-anchored drift detection, machine-checkable output contracts, and git-native versioning.

## Status

Implementation complete. Deterministic checks pass: `./setup.sh --check` clean across 16 skills and 33 core regions, `evals/test-guardrails.sh` 13/13.

Behavioral evaluation recorded in `evals/results/2026-08-30-v0.4.0-guardrails/RESULTS.md`. Scenarios 12, 13, 14, and 15 PASS at `k = 1`, with scenarios 12 and 14 re-run blind on 2026-09-06 under corrected isolation. Scenario 12's PASS is not robust to stricter wording of criteria B2 and B4.

Uncommitted. The working tree holds all v0.4.0 changes and has not been committed or pushed.

## Blockers

None. The `core-origin` tag does not exist in the published repository yet, so drift is reported as unmeasured until it is tagged.

## Next action

1. Review the diff and commit v0.4.0. Nothing is committed yet.
2. Tag `core-origin` on the reviewed baseline so drift stops reporting as unmeasured.
3. Decide whether to tighten scenario 12 criteria B2 and B4, which currently require grader judgment. This is a human specification change and creates a new scenario version.
4. Run the suite at `k >= 5` with per-scenario paired deltas, which v0.4.0 specifies but has not yet run. Trial 12b and 12c disagreed on B2, so that criterion is the known unstable one.
