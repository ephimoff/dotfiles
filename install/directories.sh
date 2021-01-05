#!/usr/bin/env bash

# Start
echo "Starting $(basename "$0")"

# create folders
[[ ! -d ~/tmp ]] && mkdir -p ~/tmp

# ssh
[[ ! -d ~/.ssh ]] && mkdir -p ~/.ssh
chmod 700 ~/.ssh

# create a symlink to the scripts folder:
ln -s ~/Projects/scripts ~/.scripts

# Finished
echo "$(basename "$0") complete."
