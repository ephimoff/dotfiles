#!/usr/bin/env bash
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# to speed things up: https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fwalch"

# turn off autoupdates
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

# cleanup history when it goes to 100 records
HISTORY="$HOME/.zsh_history" # Path to zsh history file
HISTORY_LOG="$HOME/.zsh_history.bak"
MAX_HISTORY=200 # Maximum lines to keep in history

if [[ $(expr $(wc -l < $HISTORY) \> $MAX_HISTORY) = "1" ]]; then
    cat $HISTORY >> $HISTORY_LOG && echo '' > $HISTORY
fi


# plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)
# shellcheck disable=SC2034
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# shellcheck disable=SC1090
source "$ZSH/oh-my-zsh.sh"



# Start SSH agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" > /dev/null
fi

# Add only private keys (excluding .pub files)
for key in ~/.ssh/*; do
    if [[ -f "$key" && "$key" != *.pub ]]; then
        ssh-add --apple-use-keychain "$key" 2>/dev/null
    fi
done

# pager
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"


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

# scripts
# export PATH="$HOME/Projects/scripts:$PATH"
# export PATH="$HOME/.scripts:$PATH"
# export PATH="$HOME/Library/Android/sdk:$PATH"

# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Added by Amplify CLI binary installer
# export PATH="$HOME/.amplify/bin:$PATH"
