#!/usr/bin/env bash

# Start
echo "Starting $(basename "$0"). Note: it may take a while"

# Ask for the administrator password upfront
sudo -v

# Install everything from a Brewfile
brew bundle --file="${HOME}/Projects/dotfiles/applications/brew/Brewfile"

echo "Cleaning up unneeded files..."
brew cleanup

# Finished
echo "$(basename "$0") complete."
