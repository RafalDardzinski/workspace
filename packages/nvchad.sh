#!/usr/bin/env zsh
# Installs NvChad extension to Neovim.

NVIM_CONFIG="${XDG_CONFIG_HOME}/nvim"

git clone https://github.com/NvChad/starter "$NVIM_CONFIG" && \
  nvim && \
  rm -rf "$NVIM_CONFIG/.git"
