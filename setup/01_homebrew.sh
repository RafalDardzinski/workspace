#!/usr/bin/env bash
BASE_DIR="$(dirname "${BASH_SOURCE[0]}")"

brew bundle --file "${BASE_DIR}/../packages/Brewfile"
