#!/usr/bin/env bash
# Installs core packages.

pacman -Syu --noconfirm \
  aspnet-runtime \
  curl \
  dotnet-sdk \
  neovim \
  nvm \
  otf-firamono-nerd \
  podman \
  podman-compose \
  podman-docker \
  rsync \
  ripgrep \
  starship \
  stow \
  tmux \
  tree-sitter-cli \
  yazi \
  zip \
  zsh \
  zsh-autocomplete \
  zsh-autosuggestions \
  zsh-syntax-highlighting

