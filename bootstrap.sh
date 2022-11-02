#!/usr/bin/env bash

# If a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

echo "During the installation you might need to type the system password several times."
echo "Note that some of these changes require a logout/restart to take effect."


./install/brew-install.sh
./install/brew.sh
./install/dotfiles.sh
./install/applications.sh
./install/oh-my-zsh.sh

# Finished
echo "$(basename "$0") complete."
