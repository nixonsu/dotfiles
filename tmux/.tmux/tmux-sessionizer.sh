#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    {
      printf '%s\n' "$HOME"
      for root in "$HOME/personal" "$HOME/repos" "$HOME/dev"; do
        if [[ -d "$root" ]]; then
          printf '%s\n' "$root"
          find "$root" -mindepth 1 -maxdepth 1 -type d
        fi
      done
    } | fzf
  )
fi

[[ -n "$selected" ]] || exit 0
[[ -d "$selected" ]] || { printf 'Directory not found: %s\n' "$selected" >&2; exit 1; }
selected_name=$(basename "$selected" | tr '.: ' '___')

if ! tmux has-session -t "=$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

if [[ -z "${TMUX:-}" ]]; then
  tmux attach-session -t "=$selected_name"
else
  tmux switch-client -t "=$selected_name"
fi
