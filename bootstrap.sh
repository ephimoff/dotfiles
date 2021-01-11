#!/usr/bin/env bash

echo "During the installation you might need to type the system password several times."
echo "Note that some of these changes require a logout/restart to take effect."

# directory="${HOME}/Projects/install_dotfiles"

# "$directory/clone_dotfiles.sh"
./install/brew-install.sh
./install/directories.sh
# ./install/macos.sh
./install/brew.sh
./install/dotfiles.sh
./install/applications.sh
./install/oh-my-zsh.sh

# Finished
echo "$(basename "$0") complete."
