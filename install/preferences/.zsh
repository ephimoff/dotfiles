#!/usr/bin/env bash

###############################################################################
# .zshrc config
###############################################################################

# If a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

source=$HOME/Projects/dotfiles/dotfiles/.zshrc

target=$HOME/.zshrc

echo ".zshrc: Linking config files"
if [[ -f "$source" ]] ; then
    echo ".zshrc: Remove file"
    [[ -f "$target" ]] && rm -rf "$target"
    ln -s "$source" "$target"
fi