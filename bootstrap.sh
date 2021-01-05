#!/usr/bin/env bash

echo "During the installation you might need to type the system password several times."
echo "Note that some of these changes require a logout/restart to take effect."

# directory="${HOME}/Projects/install_dotfiles"

# "$directory/clone_dotfiles.sh"
./install/0-brew-install.sh
./install/1-directories.sh
./install/2-macos.sh
./install/3-brew.sh
./install/4-dotfiles.sh
./install/5-applications.sh
./install/6-oh-my-zsh.sh

# Finished
echo "$(basename "$0") complete."
