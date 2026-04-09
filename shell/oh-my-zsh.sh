#!/usr/bin/env zsh
# Installs oh-my-zsh shell extension.

set -eo pipefail

if [[ -z "$ZDOTDIR" ]]; then
  echo "ZDOTDIR is not set!" >&2
  exit 1
fi

mkdir -p $ZDOTDIR

RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
zsh -ic "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
&& if ! grep -q "source ${ZDOTDIR}/.ohmyzshrc" "${ZDOTDIR}/.zshrc"; then printf '%s\n' "source ${ZDOTDIR}/.ohmyzshrc" >> "${ZDOTDIR}/.zshrc"; fi
