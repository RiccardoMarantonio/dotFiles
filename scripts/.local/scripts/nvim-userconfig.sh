#!/usr/bin/env bash

XDG_DATA_HOME=$HOME/.local/share/nvim-dev \
  XDG_CONFIG_HOME=$HOME/.config/nvim-dev \
  XDG_STATE_HOME=$HOME/.local/state/nvim-dev \
  XDG_CACHE_HOME=$HOME/.cache/nvim-dev \
  nvim
