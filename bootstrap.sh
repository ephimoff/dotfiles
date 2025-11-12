#!/usr/bin/env bash

# If a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"

echo "During the installation you might need to type the system password several times."
echo "Note that some of these changes require a logout/restart to take effect."


"$DOTFILES_DIR/install/brew-install.sh"
"$DOTFILES_DIR/install/brew.sh"
"$DOTFILES_DIR/install/dotfiles.sh"
"$DOTFILES_DIR/install/applications.sh"
"$DOTFILES_DIR/install/oh-my-zsh.sh"

# Finished
echo "$(basename "$0") complete."
