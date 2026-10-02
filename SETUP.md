# First-use setup

`./setup.sh` is optional. It makes skills callable by name, validates canonical skills, and creates repo-local discovery links without installing dependencies or storing connector secrets. `./setup.sh --check` is non-mutating.

## Two ways to start

- **Trial.** The user names their company. `configure-workspace` trial mode fills `context.md` from public pages, tagged `unconfirmed`, and the user corrects it. Skills that need private sources stay blocked until they are set up just in time.
- **Full setup.** Follow the sequence below.

If the first prompt does not pick one, offer both. If it does, start that path.

Use configure-workspace and ask one question at a time; do not require every field before providing value.

For an active task, ask only for task-critical scope, sources, permissions, privacy constraints, and definitions. Provide a bounded provisional result and leave unrelated fields as gaps.

## Setup sequence

1. Learn the company and product in one or two sentences.
2. Identify the primary users and important roles or personas.
3. Ask where product documentation, research, roadmaps, support tickets, team communication, and meeting records live.
4. Ask whether the company has a communication style guide or preferred update format.
5. Ask where metrics, event definitions, and data dictionaries live.
6. Define the default timezone and whether reporting periods use a calendar or fiscal calendar.
7. Record metric, entity, identity, source-of-truth, and terminology definitions. For longitudinal account/workspace metrics, confirm stable cohort identity, assignment time, and merge/split treatment; otherwise keep dependent work partial or blocked.
8. Ask how test, employee, bot, demo, deleted, duplicate, and internal accounts are identified.
9. Record QA personas and credential environment-variable names only. With permission, append only missing blank declarations to an ignored, untracked `.env` using name-only inspection; never inspect, overwrite, or print values. Otherwise list required names and keep QA partial.
10. Ask where the design system and existing prototypes live.
11. Discover which MCPs, CLIs, APIs, databases, files, and browser tools are currently available.
12. For each task-relevant source, record its pointer; non-secret handle or supplied artifact; scope with absolute authorization dates; read/write capability; privacy, retention, and freshness boundaries; and owner when known.
13. Separately record user-reported verification, current runtime addressability, and an agent-observed bounded read with an absolute last-verified time. Authentication or prior reports do not prove readiness; only addressable, authorized, scoped, agent-observed sources are executable-ready.
14. Ask which self-improvement mode to use: off, suggest, or safe-auto. Recommend suggest for first use.
15. Record only source pointers and non-secret conventions in context.md.
16. Report skill readiness as ready, partial, or blocked with an exact next step for each gap.
17. Map confirmed sources in index.md, preserving absolute authorization windows and last agent-observed verification dates.
18. Mark setup complete enough for the first task; preserve unknowns as gaps rather than guessing.

## Completion criteria

Setup is sufficient when the decision, product and users, source scopes, permissions, privacy limits, definitions and joins, time boundaries, and contamination rules are known. At least one task-relevant source must be addressable and agent-observed through a bounded read, including a readable supplied artifact; otherwise report blocked. Longitudinal account/workspace work also requires stable cohort identity and task-critical merge/split treatment.

A trial is sufficient for public-evidence questions once the user has approved the pre-filled profile and `public-web` has an agent-observed read. It is not sufficient for analytics, tickets, meetings, or communications.

Setup is resumable. Record overall and per-skill readiness in context.md so later tasks ask only for newly relevant gaps.
