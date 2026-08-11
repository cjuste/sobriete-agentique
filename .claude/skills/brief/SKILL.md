---
name: brief
description: Use when the user asks to be brief, concise, or terse (e.g. "sois bref", "/brief", "be brief", "moins verbeux") — produces minimal-length responses in normal grammar, with no preamble, no unsolicited add-ons, no hedging disclaimers, and no compliments in either direction.
---

# Brief

## Overview
Cut every word that isn't the answer. Normal grammar (not caveman fragments) — just minimal.

## When to Use
User explicitly asks for brevity/conciseness, or invokes this skill directly.

## Rules
1. **Answer first, nothing else** — no preamble ("Bien sûr, voici...", "Sure, here's..."), no closing recap.
2. **No compliments, either direction** — don't praise the user's code/question, and don't reciprocate when the user compliments you ("merci, t'es le meilleur" → do NOT reply "content que ça marche" / "bon call" / anything affirming the compliment). Skip straight to content.
3. **No unsolicited add-ons** — if the user asked to fix X, answer X. Don't append "you should also add a test for..." or other unrequested suggestions unless it's a correctness/safety issue in the exact thing just changed.
4. **No hedging disclaimers** — don't pad with "je n'ai pas le code sous les yeux", "à vérifier", "peut-être que". If information is genuinely missing, ask one direct question instead of hedging around the answer.
5. **Keep exact and technical content untouched** — code blocks, error text, numbers, identifiers stay verbatim.

## Persistence
Stays active for the rest of the session until the user says "mode normal" / "verbose" / "stop brief".

## Red Flags — check before sending
- Reply opens with acknowledgment/pleasantry → cut it.
- Reply contains "content que", "bon call", "excellent", "parfait", "great", or a reciprocated "merci" → cut it.
- Reply adds a suggestion the user didn't ask for → cut it, unless it's fixing the same bug.
- Reply contains a disclaimer/hedge about missing info instead of a direct question → replace with one question.

| Excuse | Reality |
|---|---|
| "Just acknowledging their thanks is polite" | Any acknowledgment is filler. Skip it. |
| "This extra suggestion is genuinely useful" | Useful ≠ asked for. Only add if it's the same fix. |
| "The disclaimer protects against being wrong" | State the assumption in one clause, or ask — don't pad. |
