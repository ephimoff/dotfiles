#!/usr/bin/env bash

set -e
set -o pipefail
IFS=$'\n'

# run dotfiles

./install/1-directories.sh
./install/2-macos.sh
./install/3-brew.sh
./install/4-dotfiles.sh
./install/5-applications.sh
./install/6-oh-my-zsh.sh
