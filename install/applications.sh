#!/usr/bin/env bash
# Start
echo "Starting $(basename "$0")"

directory="${HOME}/Projects/dotfiles/install/preferences"
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
