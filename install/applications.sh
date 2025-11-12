#!/usr/bin/env bash

# If a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

# Get the dotfiles directory (parent of install/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Export DOTFILES_DIR so preference scripts can use it
export DOTFILES_DIR

# Start
echo "Starting $(basename "$0")"

directory="$DOTFILES_DIR/install/preferences"
files=$(find "$directory" -iname ".*" -maxdepth 1 -type f)

# shellcheck disable=SC2068
for file in ${files[@]} ; do
    if [[ -f "$file" ]] ; then
        # shellcheck disable=SC1090
        source "$file"
    fi
done

# Finished
echo "$(basename "$0") complete."
