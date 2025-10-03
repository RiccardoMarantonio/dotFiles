#!/usr/bin/env bash

tmux list-sessions -F '#{session_name}'
find ~/.config -maxdepth 1 \( -type d -o -type l \)
find ~/Projects -maxdepth 2 -type d
find ~/.local -name "scripts" -type d -maxdepth 1 -o -type l
