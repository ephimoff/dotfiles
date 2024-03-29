#!/usr/bin/env bash

# If a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

# Start
echo "Starting $(basename "$0")"

directory="${HOME}/Projects/dotfiles/dotfiles"
# directory="../dotfiles"
backup=~/.dotfiles_backup
files=$(find "$directory" -iname ".*" -maxdepth 1 -type f)

function doIt() {
    # make the backup directory
    [[ ! -d "$backup" ]] && mkdir -p "$backup"

    # move existing dotfiles to backup, then create symlinks from directory to ~
    # shellcheck disable=SC2068
    for file in ${files[@]} ; do
        if [[ -f "$HOME/$(basename "$file")" ]] ; then
            echo "Moving $HOME/$(basename "$file") to $backup"
            mv -n "$HOME/$(basename "$file")" "$backup"/
        
        fi
        echo "Symlinking $file to $HOME/$(basename "$file")"
        ln -f -s "$file" "$HOME/$(basename "$file")"
    
    done
}

read -r -p "This script will backup your current dotfiles and symlink to a new set of dotfiles. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]] ; then
    doIt
fi

unset doIt

# Finished
echo "$(basename "$0") complete."
