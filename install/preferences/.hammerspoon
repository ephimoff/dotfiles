#!/usr/bin/env bash

###############################################################################
# Hammerspoon.app
###############################################################################

hammerspoonSource=$HOME/Projects/dotfiles/applications/hammerspoon/.hammerspoon/

hammerspoonTarget=$HOME/.hammerspoon    

echo "Hammerspoon: Linking config file and Spoons plugins"
if [[ -d "$hammerspoonSource" ]] ; then
    echo "Hammerspoon: Remove shortcuts files if already exists"
    [[ -d "$hammerspoonTarget" ]] && rm -rf "$hammerspoonTarget"
    ln -s "$hammerspoonSource" "$hammerspoonTarget"
fi