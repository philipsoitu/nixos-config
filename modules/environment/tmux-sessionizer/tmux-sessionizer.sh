#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    {
      # The nixos-config checkout is always available to the sessionizer.
      [[ -d "$HOME/nixos-config" ]] && printf '%s\n' "$HOME/nixos-config"

      # Add one directory to search per line in this file.
      sessionizer_config="$HOME/.tmux-sessionizer"
      if [[ -f $sessionizer_config ]]; then
        while IFS= read -r directory || [[ -n $directory ]]; do
          # Ignore empty lines and comments.
          [[ -z $directory || $directory == \#* ]] && continue

          # Allow paths relative to the home directory in the config file.
          case $directory in
            \~/*) directory="$HOME/${directory:2}" ;;
            \$HOME/*) directory="$HOME/${directory:6}" ;;
          esac

          if [[ -d $directory ]]; then
            find "$directory" -mindepth 1 -maxdepth 1 -type d
          fi
        done < "$sessionizer_config"
      fi
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
