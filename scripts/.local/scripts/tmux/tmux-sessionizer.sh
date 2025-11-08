#!/usr/bin/env bash

if [[ -z $TMUX ]]; then
    exit 0
fi

selected=$(
    "$SCRIPTS/tmux/listSessions.sh" | fzf \
        --prompt "Select a TMUX session or directory: " \
        --bind "ctrl-x:execute($SCRIPTS/tmux/killSession.sh {})+reload($SCRIPTS/tmux/listSessions.sh)" \
        --ansi
    # --multi \
)
if [[ -z $selected ]]; then
    echo "No directory selected."
    exit 0
fi

selected=$(echo "$selected" | sed -E 's/...//')
selected=$(echo "$selected" | sed -E "s|~|$HOME|")
selected_name=$(basename "$selected")

if ! tmux has-session -t "$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi
tmux switch-client -t "$selected_name"
