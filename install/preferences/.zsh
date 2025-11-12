#!/usr/bin/env bash

###############################################################################
# .zshrc config
###############################################################################

# If a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

# Get the dotfiles directory (go up two levels from install/preferences/)
if [[ -z "$DOTFILES_DIR" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    DOTFILES_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
fi

source=$DOTFILES_DIR/dotfiles/.zshrc

target=$HOME/.zshrc

echo ".zshrc: Linking config files"
if [[ -f "$source" ]] ; then
    echo ".zshrc: Remove file"
    [[ -f "$target" ]] && rm -rf "$target"
    ln -s "$source" "$target"
fi