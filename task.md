# Current task

## Goal

Ship v0.5.0: optional setup with a trial path, and PM-first upgrades to existing skills (product context, competitive analysis, customer evidence, prototyping) sharing one public-research method. No new skills. Each upgrade is built on a screened existing skill and leans toward PMs by default while staying usable by anyone.

## Status

Design and implementation plan written in `docs/plans/` (2026-10-03). No skill files changed yet.

v0.4.0 is committed (`b936ab5`) and merged (`ff0d824`). The v0.4.1 docs shipped in `c285b8e` and `b196b99`.

The `core-origin` tag exists, so drift is now measured against it.

`./setup.sh` was run locally on 2026-10-02. All 16 skills are linked in `.agents/skills/` and `.claude/skills/`. `./setup.sh --check` reports 16 skills valid, cores match `core.sha256`, and no pending items.

## Blockers

None.

## Open items (not decided)

1. Decide whether to tighten scenario 12 criteria B2 and B4, which currently require grader judgment. This is a human specification change and creates a new scenario version. Trials 12b and 12c disagreed on B2.
2. Run the suite at `k >= 5` with per-scenario paired deltas. This has never been run.

## Candidates (not decided)

The PM has not chosen any of these. They are options, not plans.

- v0.6 skills: `record-decision`, `write-spec`, `review-brief`, `design-experiment`.

## Next action

1. PM picks the execution mode for `docs/plans/2026-10-03-v0.5.0-implementation-plan.md` (subagent-driven recommended).
2. Execute Setup, then Tasks 1–6. Task 7 is the PM release review.
3. Open: confirm the license on OpenAI's `agent/refresh-role-plugins` branch, or keep `build-competitive-brief` as ideas only.
