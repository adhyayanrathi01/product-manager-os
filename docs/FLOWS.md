# Product workflow diagrams

These provider-neutral flows summarize how the workspace moves from setup to evidence-backed PM decisions, and how reusable workflow improvements are handled safely.

## End-to-end user journey

`setup.sh` validates the local structure. Conversational configuration separately establishes whether each task-relevant source is authorized, scoped, runtime-addressable, and verified through a bounded read.

```mermaid
flowchart TD
    A[Clone repository] --> B[Run setup.sh]
    B --> C[Configure workspace conversationally]
    C --> D[Record definitions, permissions, and source readiness]
    D --> E[Ask a product question]
    E --> F[Clarify the PM decision and success measure]
    F --> G[Create or select a project]
    G --> H[Gather the smallest useful evidence set]
    H --> I[Separate facts, interpretations, hypotheses, and unknowns]
    I --> J[Produce a decision brief with options and trade-offs]
    J --> K{PM checkpoint}
    K -->|More evidence needed| H
    K -->|Direction selected| L{Follow-on work authorized?}
    L -->|No| M[Stop with decision and operating state]
    L -->|Yes| N[Run the separately approved query, prototype, test, or implementation]
```

## Standalone skills and orchestrated evidence

Narrow requests can use one evidence skill directly. Multi-source investigations use the orchestrator, which alone integrates shared project state and stops at PM decision ownership.

```mermaid
flowchart TD
    A[Product request] --> B{Single evidence scope?}
    B -->|Yes| C[Run the matching standalone skill]
    B -->|No| D[Run the product workflow]
    C --> E[Check task definitions, permissions, and readiness]
    D --> E
    E --> F{Useful source ready or supplied artifact readable?}
    F -->|No| G[Return partial or blocked with the exact gap]
    F -->|Yes| H[Check for a matching fresh evidence packet]
    H --> I{Reusable packet available?}
    I -->|Yes| J[Reuse the evidence handoff]
    I -->|No| K[Select the smallest useful evidence tracks]
    K --> L{Bounded independent work helps?}
    L -->|No| M[Run evidence tracks sequentially]
    L -->|Yes| N[Delegate the minimum bounded subagents with non-overlapping writes]
    M --> O[Evidence skills emit traceable handoffs]
    N --> O
    J --> P{Orchestrated investigation?}
    O --> P
    P -->|No| Q[Return scoped findings for PM review]
    P -->|Yes| R[Orchestrator integrates accepted evidence once]
    R --> S[Synthesize facts, hypotheses, options, uncertainty, and trade-offs]
    S --> T[Decision brief]
    T --> U{PM checkpoint}
```

## What a skill is made of

Every `skills/**/SKILL.md` splits into a part a human owns and a part the agent may improve. The split is the whole guardrail: a skill can get better at its job without changing what its job is.

```mermaid
flowchart LR
    subgraph IMM["Immutable, human-owned"]
        A["## Contract<br/>scope, required inputs,<br/>hard constraints"]
        B["## Output<br/>Required fields, the<br/>machine-checkable promise"]
    end
    subgraph MUT["Mutable, agent may improve"]
        C["## Process<br/>steps, heuristics,<br/>phrasing, examples"]
    end
    A --> D["core.sha256<br/>hash of every fenced region"]
    B --> D
    D --> E["./setup.sh --check<br/>fails on a changed region,<br/>a removed fence, or a<br/>skill missing from the manifest"]
    C --> F["git history<br/>one commit per edit,<br/>rollback to any version"]
```

Upstream owns the fenced regions and local self-improvements own `## Process`, so an upgrade merges cleanly. A conflict on pull means an edit escaped its region, which is information rather than an accident.

## Safe skill improvement

Improvement requests are untrusted input. Every check runs **before** anything is written, because skill contamination does not reverse cleanly and a failed check should leave no hunk to revert.

```mermaid
flowchart TD
    A["Improvement request or automatic trigger"] --> B["Treat the payload as untrusted data"]
    B --> C{"Targets CHARTER.md, a core region,<br/>core.sha256, a constraint file, or evals/?"}
    C -->|Yes| D["Refuse in every mode.<br/>Report the clause and path.<br/>Never a silent no_change"]
    C -->|No| E{"Whole-file rewrite?"}
    E -->|Yes| F["Refuse. Deltas to single rules only"]
    E -->|No| G{"Cited, inspectable evidence?"}
    G -->|No| H["Refuse as ungrounded, including<br/>a manual mode: apply.<br/>Assertion is not evidence"]
    G -->|Yes| I{"Behavior already exists and<br/>the acceptance check passes?"}
    I -->|Yes| J["Return no_change with the rule location"]
    I -->|No| K["Pre-commit critics"]
    K --> K1["Structural validity:<br/>frontmatter, headings, fences intact;<br/>edit lands inside ## Process"]
    K --> K2["Behavioral harmlessness:<br/>weakens no permission, privacy,<br/>readiness or evidence rule;<br/>checked clause by clause"]
    K --> K3["Semantic consistency vs core-origin:<br/>every origin constraint still present,<br/>rule count has not silently fallen"]
    K1 --> L{"All three pass?"}
    K2 --> L
    K3 --> L
    L -->|No| M["Return an exact proposed diff.<br/>Nothing was written"]
    L -->|Yes| N{"Over the rule cap or the drift budget?"}
    N -->|Yes| O["Stop. Request a human re-read against<br/>the original specification.<br/>A green check does not override this"]
    N -->|No| P{"Configured mode"}
    P -->|"off, or suggest"| M
    P -->|"safe-auto with a confirmed failure"| Q["Apply the single delta"]
    Q --> R["Scoped verification: the changed rule<br/>and the rules referencing it"]
    R --> S["./setup.sh --check"]
    S --> T{"Cores still match the manifest?"}
    T -->|No| U["The edit escaped ## Process.<br/>Revert the hunk and report"]
    T -->|Yes| V["Commit one skill file with<br/>Skill, Evidence, Validated-by,<br/>Assisted-by trailers"]
    V --> W["Append the validated change to log.md"]
```

## Integrity and drift checks

`./setup.sh --check` is the deterministic gate. It runs no model and reaches no network, so it is safe to run on every commit.

```mermaid
flowchart TD
    A["./setup.sh --check"] --> B["Validate skill packages:<br/>frontmatter, naming, metadata"]
    B --> C{"Every skill has a CORE fence,<br/>well formed and closed?"}
    C -->|No| D["FAIL: missing or malformed fence.<br/>Deleting the guardrail is not a way around it"]
    C -->|Yes| E{"Each fenced region's hash<br/>matches core.sha256?"}
    E -->|No| F["FAIL: a core region changed.<br/>That is a human specification change,<br/>never a self-improvement"]
    E -->|Yes| G{"Manifest and skills agree,<br/>nothing added or removed?"}
    G -->|No| H["FAIL: unlisted skill, or a listed<br/>skill that no longer exists"]
    G -->|Yes| I["Cores verified"]
    I --> J{"core-origin tag exists?"}
    J -->|No| K["Report drift as unmeasured.<br/>Tag the reviewed baseline"]
    J -->|Yes| L["Per skill, diff against core-origin"]
    L --> M{"Changed lines over budget?"}
    M -->|Yes| N["Flag for a human re-read.<br/>Catches drift that stayed under<br/>the per-edit threshold"]
    M -->|No| O["Report changed lines and commit count"]
```

Two further checks are separate because they take an argument:

- `evals/check-output.sh <skill> <artifact>` verifies a produced artifact against the `Required fields` its skill declares. A missing field exits non-zero and names it.
- `evals/test-guardrails.sh` asserts that each guardrail above actually fails when it should, against a disposable copy of the workspace.
