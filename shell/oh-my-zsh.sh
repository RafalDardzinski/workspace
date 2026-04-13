#!/usr/bin/env zsh
# Installs oh-my-zsh shell extension.

set -eo pipefail

if [[ -z "$ZDOTDIR" ]]; then
  echo "ZDOTDIR is not set!" >&2
  exit 1
fi

mkdir -p $ZDOTDIR

RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

