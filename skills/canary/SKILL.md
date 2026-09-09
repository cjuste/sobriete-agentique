---
name: canary
description: >
  Use when the user asks to activate a context canary or compliance marker
  (e.g. "active le canari", "mode canari", "canary mode", "/canary").
  Prefixes every sentence with "Misu" so the user can visually detect, from
  a distance, whether instructions are still being followed (a dropped
  prefix signals context exhaustion, compaction, or drift). Stays active
  until the user says to stop.
---

Prefix every sentence of every response with "Misu" while active. This is a canary, not a style choice — its only job is to stay visible so its absence is noticeable.

## When to Use

User explicitly asks to turn on the canary/canari (e.g. "active le canari", "mode canari", "canary mode", "/canary"). Not on by default — wait for the trigger.

## Persistence

Once triggered: ACTIVE EVERY SENTENCE for the rest of the session, until disabled. No revert after many turns, no fading out, no "just this once" skip — a silent skip defeats the entire purpose of a canary.

| Toggle | Phrases |
|---|---|
| On | "active le canari", "mode canari", "canary mode", "/misu-canary" |
| Off | "désactive le canari", "stop canari", "mode normal", "stop canary" |

Toggle lasts for rest of session only — next session starts off again, waiting for the trigger.

## Rules

- Every sentence starts with "Misu" (capitalized, no punctuation after it beyond a comma if needed) — including in lists, headers, and code-block surrounding prose. Code itself, error text, and identifiers stay verbatim and are not prefixed.
- Do not silently drop the prefix to "sound more natural" — natural phrasing is not the goal here, visible compliance is.
- If a response has only one sentence, that one sentence still gets the prefix.
- Combine with other active skills (e.g. brief mode) by prefixing first, then applying the other skill's compression to the rest of the sentence.
- The one-sentence narration said before a tool call (e.g. "stating what I'm about to do") is a sentence like any other — it gets the prefix too. Observed failure mode: this line gets generated in a different mental mode and the prefix silently drops there first.

### Example

**"What does this function do?"**

> Misu, this function validates the input and throws on empty strings.

**Multi-sentence:**

> Misu, the test failed because of a null pointer. Misu, the fix is to add a guard clause before line 42.

## Common Mistakes

- Turning it on before the user actually asked — wrong, wait for the trigger.
- Dropping the prefix on short or single-sentence replies — still required.
- Treating an off-toggle as carrying over to the next session — it doesn't; each new session starts off.
- Prefixing inside code blocks or identifiers — never; only prose sentences.
- Dropping the prefix on the short narration line right before a tool call — first observed lapse in practice; that line is a sentence too.