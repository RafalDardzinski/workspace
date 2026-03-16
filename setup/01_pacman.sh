#!/usr/bin/env bash
BASE_DIR="$(dirname "${BASH_SOURCE[0]}")"

pacman -Sy --noconfirm archlinux-keyring && \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm --needed - < "${BASE_DIR}/../packages/pacman.txt" && \
  update-ca-trust
