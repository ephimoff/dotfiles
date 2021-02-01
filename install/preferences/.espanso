#!/usr/bin/env bash

###############################################################################
# espanso - text expander https://espanso.org/
###############################################################################

source=$HOME/Projects/dotfiles/applications/espanso

target=$HOME/Library/Preferences/espanso  

echo "Espanso: Linking config files"
if [[ -d "$source" ]] ; then
    echo "Espanso: Remove folder"
    [[ -d "$target" ]] && rm -rf "$target"
    ln -s "$source" "$target"
fi