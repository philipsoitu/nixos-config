#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    {
      [[ -d "$HOME/nixos-config" ]] && printf '%s\n' "$HOME/nixos-config"

      for directory in "$HOME/work" "$HOME/code" "$HOME/McGill/W26"; do
        if [[ -d $directory ]]; then
          find "$directory" -mindepth 1 -maxdepth 1 -type d
        fi
      done
    } | fzf
  )
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -z ${TMUX:-} ]]; then
  if tmux has-session -t="$selected_name" 2>/dev/null; then
    exec tmux attach-session -t "$selected_name"
  else
    exec tmux new-session -s "$selected_name" -c "$selected"
  fi
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -d -s "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
