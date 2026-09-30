#!/bin/sh
# Claude Code status line: model name (colored by model cost tier) +
# context window fill percentage (colored by usage: <50% green, 50-69% yellow, >=70% red).
input=$(cat)

model=$(printf '%s' "$input" | jq -r '.model.display_name')
used=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')

# Model color by cost tier: Sonnet (cheap) green, Opus (mid) yellow, Fable (expensive) red.
case "$model" in
  *Fable*) model_color='\033[1;91m' ;;   # bold bright red
  *Opus*) model_color='\033[1;93m' ;;    # bold bright yellow
  *Sonnet*) model_color='\033[1;92m' ;;  # bold bright green
  *) model_color='\033[1m' ;;            # bold default (e.g. Haiku, unknown)
esac

if [ -n "$used" ]; then
  used_rounded=$(printf '%.0f' "$used")

  if [ "$used_rounded" -ge 70 ]; then
    context_color='\033[1;91m'   # bold bright red
  elif [ "$used_rounded" -ge 50 ]; then
    context_color='\033[1;93m'   # bold bright yellow
  else
    context_color='\033[1;92m'   # bold bright green
  fi

  printf "${model_color}%s\033[0m \033[2m|\033[0m ${context_color}Context: %s%%\033[0m\n" "$model" "$used_rounded"
else
  printf "${model_color}%s\033[0m\n" "$model"
fi
