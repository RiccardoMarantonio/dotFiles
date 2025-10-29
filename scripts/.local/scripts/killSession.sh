#!/usr/bin/env bash
set -euo pipefail

echo "$1"

original=$(printf "%s\n" "$1" | sed -E 's/\x1b\[[0-9;]*m//g; s/^[[:space:]]*\[TMUX\][[:space:]]*//')

tmux kill-session -t "$original"
