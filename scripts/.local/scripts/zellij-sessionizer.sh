#!/usr/bin/env bash

#Exit the current zellij session if it exists

current_session=$(zellij list-sessions | grep "current")
if [[ -n "$current_session" ]]; then
    session_name=$(awk '{print $1}' <<<"$current_session")
    session_name=$(echo "$session_name" | sed -E 's/\x1b\[[0-9;]*m//g')
    echo "Session Found: $session_name"
    zellij kill-session "$session_name"
fi

# SELECT THE PROJECT DIRECTORY

project_dir="$(find ~/Documents/Coding ~/.config ~/.local ~/Documents/Università ~/dotFiles -mindepth 1 -type d | fzf)"

if [[ -z "$project_dir" ]]; then
    if [[ -n "$session_name" ]]; then
        zellij a "$session_name"
        exit 0
    fi
    echo "No directory selected. Exiting."
    exit 1
fi

cd "$project_dir" || exit 1

# CHECK IF A SESSION WITH THE NAME OF THE DIRECTORY ALREADY EXISTS

check_session=$(zellij list-sessions | grep "$(basename "$project_dir")")
if [[ -n "$check_session" ]]; then
    session_name=$(awk '{print $1}' <<<"$check_session")
    session_name=$(echo "$session_name" | sed -E 's/\x1b\[[0-9;]*m//g')
    zellij a "$session_name"
    exit 0
fi

# CREATE A NEW SESSION WITH THE NAME OF THE DIRECTORY

echo "Creating new session for: $(basename "$project_dir")"
session_name=$(basename "$project_dir")
zellij -s "$session_name"
