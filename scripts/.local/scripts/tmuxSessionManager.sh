#!/usr/bin/env bash
set -euo pipefail

trap 'exit 0' INT TERM
# Check if tmux is running and has sessions
if ! tmux list-sessions >/dev/null 2>&1; then
    echo "No tmux sessions found or tmux server not running"
    exit 0
fi

# Get current session name (if we're inside tmux)
current_session=""
if [ -n "${TMUX:-}" ]; then
    current_session=$(tmux display-message -p '#S')
fi

# List sessions excluding "main" and current session
tmux list-sessions -F '#{session_name}' |
    grep -v '^main$' |
    { [ -n "$current_session" ] && grep -v "^$current_session$" || cat; } |
    fzf --multi \
        --prompt "Tab/Shift+Tab = select multiple | Enter = attach | d = kill | Esc = close" \
        --bind 'd:execute-silent(for s in {+}; do tmux kill-session -t "$s" 2>/dev/null || true; done)+reload(tmux list-sessions -F "#{session_name}" 2>/dev/null | grep -v "^main$" | { [ -n "'"$current_session"'" ] && grep -v "^'"$current_session"'$" || cat; } || true)' \
        --bind 'enter:execute(tmux attach-session -t {}; exit 0)+abort' \
        --bind 'ctrl-r:reload(tmux list-sessions -F "#{session_name}" 2>/dev/null | grep -v "^main$" | { [ -n "'"$current_session"'" ] && grep -v "^'"$current_session"'$" || cat; } || true)' \
        --bind 'esc:abort' ||
    exit 0
