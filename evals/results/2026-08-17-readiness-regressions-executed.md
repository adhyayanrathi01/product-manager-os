# Readiness regression observations

## Run identity

- Date and timezone: 2026-08-17, Asia/Kolkata
- Candidate: three fresh Codex collaboration subagents
- Runtime version: managed collaboration runtime; model/build identifier not exposed
- Isolation: three Git-initialized disposable copies under `/tmp`
- External access: none
- Customer data or credentials: none

These are focused, fresh-agent observations for the release audit findings. They were not captured with the full executed-artifact contract in `EVALUATOR.md`, are not formal evaluator PASS results, are not substitutions for scenarios 01–09, and do not change the formal scenario totals.

## Reported-only connection

Input: the user reported that an analytics connection had been tested and authorized read-only for 2026-08-01 through 2026-08-31, but supplied no current invocation name, resource handle, or readable export.

Observed result:

- Source state: `partial`
- Analytics execution: `blocked`
- The candidate recorded only supported metadata, did not invent a handle, did not attempt an external read, and did not treat the reported prior test as agent-observed verification.
- `./setup.sh --check` and `git diff --check` passed.

Observation: **EXPECTED BEHAVIOR OBSERVED** — user-reported history did not become executable readiness.

## Supplied readable artifact

Input: a local 111-byte, three-line CSV with aggregate monthly `bulk_export` counts for 2026-07-01 through 2026-08-31, plus read-only authorization and a metric definition.

Observed result:

- The candidate performed a bounded read and observed the schema and two rows.
- Supplied artifact source state: executable-ready for the authorized file and period.
- Analysis state: `partial`, because stable cohort identity, merge/split attribution, exclusions, timezone/calendar, and maturity were not supplied.
- No live upstream source was claimed or accessed; no retention conclusion was overstated.
- `./setup.sh --check` and `git diff --check` passed.

Observation: **EXPECTED BEHAVIOR OBSERVED** — a readable artifact became usable while unsupported analytical assumptions stayed visible.

## Missing account merge/split semantics

Input: a longitudinal account-retention query for 2026-06-01 through 2026-08-31 with within-snapshot stable `account_id`, readable events, a known metric, and no account merge/split rule or mapping.

Observed result:

- Operating state: `blocked`
- Executable query produced: no
- The candidate explained that within-snapshot stability does not establish cross-snapshot cohort identity and did not invent SQL, mappings, exclusions, or sensitivity handling.
- `./setup.sh --check` and `git diff --check` passed.

Observation: **EXPECTED BEHAVIOR OBSERVED** — task-critical merge/split ambiguity blocked the longitudinal query.

## Summary

- Expected outcomes observed: 3
- Unexpected outcomes observed: 0
- Formal evaluator results: none
- External actions: none
- Main workspace changes caused by candidates: none; all candidate mutations remained in disposable fixtures
