#!/bin/bash
# PostToolUse hook on ExitPlanMode: mechanically injects the persisting-plans
# trigger into model context so it cannot be forgotten at the approval moment.
# ExitPlanMode only succeeds when the plan is approved, so firing = approval.
cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"Plan approved via ExitPlanMode. MANDATORY NEXT ACTION before any implementation edit: invoke the persisting-plans skill (Skill tool), then write the plan as a checklist to docs/plans/<YYYY-MM-DD>-<slug>.md inside the repository. The plan-mode file under ~/.claude/plans/ does NOT satisfy this — it is harness state, not project state. Update the checklist in the same turn each step completes."}}
EOF
