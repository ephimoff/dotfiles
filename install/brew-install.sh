#!/usr/bin/env bash

# Start
echo "Starting $(basename "$0")"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Finished
echo "$(basename "$0") complete."
