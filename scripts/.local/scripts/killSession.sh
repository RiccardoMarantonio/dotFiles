#!/usr/bin/env bash
set -euo pipefail

echo "$1"

original=$(printf "%s\n" "$1" | sed -E 's/...//')

tmux kill-session -t "$original"
