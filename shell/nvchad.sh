#!/usr/bin/env zsh
# Installs NvChad extension to Neovim.

set -eo pipefail

if [[ -z "$XDG_CONFIG_HOME" ]]; then
  echo "XDG_CONFIG_HOME is not set!" >&2
  exit 1
fi

NVIM_CONFIG="${XDG_CONFIG_HOME}/nvim"
mkdir -p "$NVIM_CONFIG"

git clone https://github.com/NvChad/starter "$NVIM_CONFIG" && \
  zsh -ic "nvim" && \
  rm -rf "$NVIM_CONFIG/.git"
