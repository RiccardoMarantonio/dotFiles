#!/usr/bin/env bash

tmuxSessions=$(tmux list-sessions -F '#{session_name}')
tmuxSessions=$(printf "%s\n" "$tmuxSessions" | sed $'s/^/  /;')

dirs=$(
    find ~/.config -maxdepth 1 \( -type d -o -type l \)
    find ~/Projects -maxdepth 2 -type d
    find ~/.local -name "scripts" -type d -maxdepth 1 -o -type l
)

dirs=$(printf "%s\n" "$dirs" | sed $'s/^/  /;')
dirs=$(printf "%s\n" "$dirs" | sed "s|$HOME|~|")

echo "$tmuxSessions"
echo "$dirs"
