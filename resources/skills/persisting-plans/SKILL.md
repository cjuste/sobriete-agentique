---
name: persisting-plans
description: Use when writing, presenting, or getting approval on a multi-step plan for any nontrivial task — including immediately after `ExitPlanMode` is called or a Plan Mode plan is approved, before writing any implementation code — and again every time a step of that plan is completed, the plan changes, or context may be compacted or the session may end.
---

# Persisting Plans

## Overview

A plan and its progress are operational state, not conversation flavor. If they only exist in chat text or in an ephemeral todo list, they're gone the moment context compacts, the session ends, or another agent picks up the work.

**Core principle:** the moment a plan exists, it exists on disk — and the status in that file updates as each step completes, not "later" or "right before I lose context."

**`ExitPlanMode` returning approved IS the trigger to invoke this skill by name, in that same turn, before the first implementation edit.** Do not treat Plan Mode's own Write-to-`~/.claude/plans/...` step as having already covered this — it hasn't (see Rules #3). If you just called `ExitPlanMode` and it was approved, invoking this skill is the next action, not implementation.

**Mechanical enforcement:** a `PostToolUse` hook on `ExitPlanMode` (`~/.claude/hooks/persisting-plans-reminder`) injects this trigger into context at the approval moment. If you see that injected reminder, it is not optional context — it is this skill firing. Comply immediately. If the reminder does NOT appear after an approved `ExitPlanMode`, the hook is missing or broken: this skill still applies (the hook is a backstop, not the trigger), and flag the broken hook to the user.

## When to Use

- About to present a multi-step plan (via plan mode or otherwise), or a plan just got approved.
- **`ExitPlanMode` was just called / a Plan Mode plan just got approved.** Plan Mode's own plan file (e.g. `~/.claude/plans/<slug>.md`) lives outside the project repo — it is not committed, not visible to teammates, and gone from the next clone. That file satisfies Plan Mode's own mechanics, but it does NOT satisfy this skill. Write the `docs/plans/...` copy in the same turn you start implementing, every time, no exceptions for "the plan already exists somewhere."
- A step or task in an active plan just finished.
- The plan changed mid-flight (scope, order, approach).
- Context may be compacted soon, or the session may end.
- Picking up a plan that a previous session started.

**Not needed for:** a single trivial edit with no real plan.

**Already using a more specific plan-management skill?** superpowers:writing-plans, superpowers:executing-plans, and superpowers:subagent-driven-development already define their own persisted file/ledger and location for the plans they own. Follow their convention instead of inventing a second file — this skill is the default for everything else, and it tightens executing-plans by requiring the plan file's own checkboxes to be updated per step, not just an in-session todo list.

## Rules

1. **Persist before implementing.** Write the plan to disk before or immediately after it's presented/approved — never after the first implementation step.
2. **Location:** `docs/plans/<YYYY-MM-DD>-<slug>.md` in the project, unless a more specific skill already owns a different path for this plan (see above) — one file per plan.
3. **A plan file that exists outside the repo doesn't count.** Plan Mode's `~/.claude/plans/<slug>.md` is real, but it's harness state, not project state — it isn't in git, isn't visible to teammates, and won't be there for the next session or the next agent to clone this repo. Approval from `ExitPlanMode` is a trigger to write the `docs/plans/...` copy, not a substitute for it.
4. **Format:** the plan itself plus its status live in the same file, as a checklist (`- [ ]` / `- [x]`), one line per step.
5. **Update live.** The instant a step finishes, check it off (and add a one-line note if the step produced a decision worth keeping) — in the same turn, not batched.
6. **"Don't over-document" is about prose, not this file.** A deadline or a request to move fast narrows explanations and polish; it does not remove the one Write/Edit call that keeps the plan from evaporating.

## Quick Reference

| Situation | Action |
|---|---|
| About to present a plan | Write it to `docs/plans/...` before or immediately after presenting it |
| Plan gets approved | Confirm the file matches the approved form (edit if it changed during discussion) |
| A step/task completes | Check the box + one-line note, same turn — don't wait |
| Plan changes mid-flight | Edit the file to match; it's the source of truth, not your memory |
| About to compact / end session | This should be a no-op check — the file should already be current |

## Rationalization Table

| Excuse | Reality |
|--------|---------|
| "User said move fast / don't over-document" | That's about prose and ceremony, not the plan file. A checklist costs one Write call. |
| "It's a tight deadline, low ceremony is fine" | Deadline pressure is exactly when losing the plan to a context reset costs the most. |
| "The plan is cheap to restate conversationally" | Cheap for you, right now. Gone for the next session or the next agent. |
| "I'll persist status once, right before I lose context" | Reactive-only tracking means everything before that moment is unrecoverable. Update per-step, live. |
| "It's only 2-3 steps, doesn't need a file yet" | The trigger is having a plan at all, not its length. |
| "TodoWrite already tracks this" | Todos are session-local and don't survive compaction or a new session. The file does. |
| "Plan Mode already wrote a plan file" | That file lives in `~/.claude/plans/`, outside the repo — invisible to git, teammates, and the next session. Still write `docs/plans/...`. |
| "The user approved via ExitPlanMode, that's the persistence step" | Approval is the trigger, not the storage. Approval happens in chat/harness state either way; the repo copy still doesn't exist until you write it. |

## Red Flags — You're About to Skip This

- You presented a plan and moved straight to implementation without writing a file.
- You invoked another skill (tdd, executing-plans, anything) right after `ExitPlanMode` approval without invoking this one first — persistence comes before process skills.
- You just called `ExitPlanMode` (or the user approved a Plan Mode plan) and started coding — check: does `docs/plans/...` exist yet, or only `~/.claude/plans/...`?
- You finished a step and haven't touched the plan file in the same turn.
- The only place the plan's status exists is a todo list or your last chat message.
- You're about to say "let me just note where I left off" — if you're saying it now, it should already be true.

**All of these mean: stop, write/update the file now, then continue.**