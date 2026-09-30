---
name: kaizen
description: Continuous improvement of the project harness — skills, hooks, CLAUDE.md files, memory, and AGENTS.md — after a work session. Audits what exists, challenges what no longer earns its place, and proposes a balanced set of adds, modifications, and deletions. Use when the user says "kaizen", "improve the harness", "harness retro", or wants to reflect on how the tooling performed during a session.
---

# Kaizen

Kaizen is a retrospective on the **harness** — the graph of rules, skills, hooks, and context files that shape how Claude Code behaves in this project. The goal is not to accumulate; it is to keep the harness sharp.

## What counts as the harness

- `.claude/skills/` — project skills
- `.claude/agents/` — project agents
- `.claude/settings.local.json` — project-level hooks and permissions
- `CLAUDE.md` at project root + all files it references (ADRs, rules, `.claude/rules/`, etc.)
- `~/.claude/projects/<project>/memory/` — persistent memory for this project
- Any `AGENTS.md` or `GEMINI.md` in the project

## Process

### 1. Audit

Read the harness files silently. Build a mental map of what exists and what each piece claims to do.

For **referenced documents** (ADRs, rules, AGENTS.md): ask per file — is the decision still active? Is the rule still enforced, or superseded by code/tooling? Is the file still reachable from where it's referenced?

### 2. Ask about the session

Ask the user one open question: **"What created friction, what felt effortless, and what did you wish existed?"**

Listen for signals in both directions:
- Something that helped → candidate to reinforce or promote
- Something ignored or bypassed → candidate to remove or simplify
- Something missing → candidate to add
- Something that fired when it shouldn't → candidate to tighten or delete

### 3. Propose a change set

Present a table with three columns — never only adds:

| Action | Target | Rationale |
|--------|--------|-----------|
| ADD | `skills/foo` | … |
| MODIFY | `CLAUDE.md` line X | … |
| REMOVE | `skills/bar` | No longer triggered; creates noise |

**Bias toward removal.** A harness that grows only adds compounds cognitive load and prompt cost. Challenge every existing piece: *"Does this still earn its place?"* A skill that hasn't fired in weeks, a hook that duplicates a default behaviour, a memory entry that describes stale state — all are candidates for deletion, not preservation.

### 4. Challenge before acting

For each proposed change, state:
- What problem it solves (or removes)
- What the cost of the change is (risk of over-firing, under-firing, lost context)
- Whether you recommend it, and why

Ask for explicit approval on **deletions and modifications** before touching files. Additions can proceed with a single confirmation.

### 5. Apply

Make the agreed changes. For deletions, show the content being removed before deleting. For skill modifications, show a diff-style before/after.

## Principles

- **Kaizen is not additive by default.** Fewer, sharper pieces beat many blunt ones.
- **Every piece must justify its existence.** If you can't name the last three times it fired usefully, challenge it.
- **Chain integrity matters.** A skill that requires a hook to trigger, or a CLAUDE.md that references a memory entry — verify the chain is intact after any change.
- **Don't preserve history in the harness.** If something was useful last sprint and isn't now, remove it. Git is the history.
