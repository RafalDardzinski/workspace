#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -eq 0 ]]; then
  echo "No configuration(s) selected!" >&2
  exit 1
fi

CONFIGS_TO_BACKUP=("$@")
TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
CONFIGS_DIR="${XDG_CONFIG_HOME:-"${HOME}/.config"}"

BACKUPS_DIR="backup"
mkdir -p "$BACKUPS_DIR"

PATHS_TO_BACKUP=()
for c in "${CONFIGS_TO_BACKUP[@]}"; do
  FULL_PATH="${CONFIGS_DIR}/${c}"
  if [[ ! -d "$FULL_PATH" ]]; then 
    echo "The following directory does not exist, skipping: ${FULL_PATH}" >&2
    continue
  fi
  PATHS_TO_BACKUP+=("$FULL_PATH")
done

if [[ "${#PATHS_TO_BACKUP}" -eq 0 ]]; then
  echo "None of provided configuration directories exist!" >&2
  exit 1
fi

echo "The following config paths will be backed up:" >&2
printf '%s\n' "${PATHS_TO_BACKUP[@]}" >&2

BACKUP_FILE="${BACKUPS_DIR}/configs-${TIMESTAMP}.zip"
zip -r "$BACKUP_FILE" "${PATHS_TO_BACKUP[@]}"
echo "Backup ready: ${BACKUP_FILE}" >&2

