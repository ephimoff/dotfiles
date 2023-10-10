#!/usr/bin/env bash
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fwalch"

# turn off autoupdates
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true


# plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)
# shellcheck disable=SC2034
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# shellcheck disable=SC1090
source "$ZSH/oh-my-zsh.sh"

# User configuration
# rbenv
# eval "$(rbenv init - zsh)"

# aws
# export PATH="$HOME/Library/Python/3.7/bin:$PATH"
# export PATH=~/.local/bin:$PATH

# android simulator
# export ANDROID_SDK=/Users/antonefimov/Library/Android/sdk

# go
# export PATH="/usr/local/go/bin:$PATH"

# mongoDB
# export PATH=$PATH:/usr/local/mongodb/bin

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# scripts
# export PATH="$HOME/Projects/scripts:$PATH"
# export PATH="$HOME/.scripts:$PATH"
# export PATH="$HOME/Library/Android/sdk:$PATH"

# pager
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"

# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add all known keys to the SSH agent
ssh-add -A 2>/dev/null;

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# shellcheck disable=SC1090
source "$HOME/.aliases"

# shellcheck disable=SC2206
fpath=(/usr/local/share/zsh-completions $fpath)
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault


# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
