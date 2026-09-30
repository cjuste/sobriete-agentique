#!/usr/bin/env bash
# SessionStart hook: force the brief skill's default-on behavior.
# The skill's own description isn't enough on its own — the model only reads
# full skill content after invoking the Skill tool, so a passive listing
# entry can be (and was) skipped. This hook injects the skill's Rules and
# Persistence sections directly into the session so they can't be missed.
# Fires on startup/resume/clear/compact.
#
# Content is read live from SKILL.md (not duplicated here) so editing the
# skill doesn't require also editing this script. Only the hook-specific
# framing below (default-on behavior, the security/irreversible-action
# exception) is hardcoded, since it describes this hook's override of the
# skill's normal opt-in trigger, not the skill's own content.

SKILL_FILE="$HOME/.claude/skills/brief/SKILL.md"

RULES=$(awk '/^## Rules/{flag=1;next}/^## /{flag=0}flag' "$SKILL_FILE" 2>/dev/null)
PERSISTENCE=$(awk '/^## Persistence/{flag=1;next}/^## /{flag=0}flag' "$SKILL_FILE" 2>/dev/null)

if [ -z "$RULES" ]; then
  # Fallback if SKILL.md is missing/unreadable/restructured — never fail silent.
  cat << 'REMINDER'
BRIEF MODE - ACTIVE BY DEFAULT THIS SESSION:
Respond briefly starting with the very first response. No trigger phrase
needed. Could not read skills/brief/SKILL.md for current rules — invoke the
brief skill directly to load its full content.
REMINDER
  exit 0
fi

cat << HEADER
BRIEF MODE - ACTIVE BY DEFAULT THIS SESSION:
Respond briefly starting with the very first response. No trigger phrase
needed - do not wait for "sois bref"/"be brief" and do not ask the user
whether they want it, just answer minimally.

Rules (from skills/brief/SKILL.md):
$RULES
Persistence:$PERSISTENCE
Re-enable with "sois bref"/"be brief"/"/brief".
Exception: drop terseness temporarily for security warnings, irreversible-
action confirmations, or multi-step sequences where brevity risks
misreading; resume brief after.
HEADER