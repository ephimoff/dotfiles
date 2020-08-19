#!/usr/bin/env bash

# https://www.juev.org/2020/04/12/dotfiles/

# Ask for the administrator password upfront
sudo -v

## create folders
# ssh
[[ ! -d ~/.ssh ]] && mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Install everything from a Brewfile
brew bundle --file="${HOME}/Projects/dotfiles/applications/brew/Brewfile"
brew cleanup