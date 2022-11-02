#!/usr/bin/env bash

# If a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

# Start
echo "Starting $(basename "$0"). Note: it may take a while"

# Ask for the administrator password upfront
# sudo -v

# Install everything from a Brewfile
brew bundle --file="~/Projects/dotfiles/applications/brew/Brewfile"

echo "Cleaning up unneeded files..."
brew cleanup

# Finished
echo "$(basename "$0") complete."
