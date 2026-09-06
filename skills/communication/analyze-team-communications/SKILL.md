---
name: analyze-team-communications
description: "Analyze team communication from chat, email, threads, announcements, or collaboration exports to identify decisions, commitments, blockers, product signals, unresolved questions, and stakeholder concerns. Use when a PM asks about recent communication or communication related to a module, feature, team, project, topic, or date range."
---

# Analyze Team Communications

<!-- CORE:BEGIN -->
## Contract

- Require the decision, source ID, allowed scope, participant or channel boundary, absolute period, topic, and privacy or retention rules.
- Verify read authorization and a bounded source read. If coverage is partial, analyze only retrieved content and identify missing channels, threads, or dates.
- Block requests outside the permitted scope. Emit the shared evidence handoff for reusable findings.
<!-- CORE:END -->

## Process

1. Clarify the decision being supported and the requested scope:
   - date range;
   - channel, mailbox, thread, team, or participant group;
   - module, feature, project, topic, or decision.
   Resolve relative periods to absolute dates and a timezone.
2. Discover the available communication access through an MCP, CLI, API, export, or local file.
3. Confirm that the requested scope respects the user’s access and private-channel boundaries.
4. Record source coverage and exclude bots, automated alerts, repeated notifications, signatures, quoted-email duplication, and irrelevant conversation where possible.
5. Reconstruct threads and chronology before summarizing isolated messages.
6. Extract:
   - confirmed facts and evidence;
   - decisions and their owners;
   - commitments and deadlines;
   - blockers and dependencies;
   - stakeholder concerns and objections;
   - unresolved questions;
   - changes in direction;
   - repeated product signals.
7. Separate explicit statements from inferred interpretation. Do not infer emotion, intent, or consensus from weak signals.
8. Label a decision as confirmed only when the source records explicit approval from an authorized owner. Otherwise label it proposed or unclear.
9. Identify contradictions, stale decisions, unclosed loops, and missing participants.
10. Use references/communication-style.md when creating a summary or draft. Prefer company-specific guidance from context.md when present.
11. Present findings for PM review. Do not send, reply, react, or email without explicit approval.
12. Save meaningful findings using skills/evidence/evidence-handoff.md, then update the relevant project and root work files as needed.

<!-- CORE:BEGIN -->
## Output

Provide:

- Scope and source coverage
- Timeline or thread map when useful
- Confirmed decisions
- Commitments, owners, and dates
- Blockers and unresolved questions
- Stakeholder concerns and product signals
- Contradictions or stale assumptions
- Implications and suggested follow-ups for the PM
- Optional draft communication, clearly marked as unsent

Preserve attribution only when it materially supports follow-up or accountability.

**Required fields:** Scope and source coverage|Confirmed decisions|Commitments|Blockers|Stakeholder concerns|Contradictions|Implications for the PM

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh analyze-team-communications <artifact>`.
<!-- CORE:END -->
