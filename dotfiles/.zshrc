#!/usr/bin/env bash
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
# shellcheck disable=SC2034
ZSH_THEME="powerlevel9k/powerlevel9k"

# powerlevel9k customisation
# shellcheck disable=SC2034
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
# shellcheck disable=SC2034
POWERLEVEL9K_TIME_BACKGROUND='black'
# shellcheck disable=SC2034
POWERLEVEL9K_TIME_FOREGROUND='grey'
# Enable command auto-correction.
#ENABLE_CORRECTION="true"

# plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)
# shellcheck disable=SC2034
plugins=(git autojump npm copydir osx brew docker)
# shellcheck disable=SC1090
source $ZSH/oh-my-zsh.sh

# User configuration
# rbenv
eval "$(rbenv init - zsh)"


# orion: graviton
export PATH="$HOME/Projects/orion/rgrav:$PATH"
export PATH="$HOME/.usr/graviton-cli/bin:$PATH"


# go
# export PATH="/usr/local/go/bin:$PATH"

# mongoDB
# export PATH=$PATH:/usr/local/mongodb/bin

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# scripts
export PATH="$HOME/Projects/scripts:$PATH"
export PATH="$HOME/.scripts:$PATH"

# pager
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add all known keys to the SSH agent
ssh-add -A 2>/dev/null;


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# shellcheck disable=SC1090
source "$HOME/.aliases"

# Load functions
# shellcheck disable=SC1090
source "$HOME/.functions"

# To retain the / added after completing directories or symbolic links to directories
setopt no_auto_remove_slash

# shellcheck disable=SC2206
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
