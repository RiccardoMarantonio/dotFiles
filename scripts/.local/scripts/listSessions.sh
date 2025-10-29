#!/usr/bin/env bash

tmuxSessions=$(tmux list-sessions -F '#{session_name}')
tmuxSessions=$(printf "%s\n" "$tmuxSessions" | sed $'s/^/ \e[33m[TMUX] /; s/$/\e[0m/')
echo "$tmuxSessions"

# Remove ANSI codes and the literal '[TMUX]' prefix with optional leading spaces
# original=$(printf "%s\n" "$tmuxSessions" | sed -E 's/\x1b\[[0-9;]*m//g; s/^[[:space:]]*\[TMUX\][[:space:]]*//')
# echo "$original"

find ~/.config -maxdepth 1 \( -type d -o -type l \)
find ~/Projects -maxdepth 2 -type d
find ~/.local -name "scripts" -type d -maxdepth 1 -o -type l
