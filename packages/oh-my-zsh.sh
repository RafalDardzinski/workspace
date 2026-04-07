#/usr/bin/env zsh
# Installs oh-my-zsh shell extension.

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && printf '%s\n' "source .ohmyzshrc" >> "${ZDOTDIR}/.zshrc"
