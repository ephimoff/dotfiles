#!/usr/bin/env bash
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# zsh plugins
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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
# fpath=(/usr/local/share/zsh-completions $fpath)
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/vault vault



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

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# enable starship
eval "$(starship init zsh)"

# bun completions
[ -s "/Users/anton.efimov/.bun/_bun" ] && source "/Users/anton.efimov/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# python
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# volta
export PATH="/Users/anton.efimov/.volta/bin:$PATH"


# Added by Antigravity
export PATH="/Users/anton.efimov/.antigravity/antigravity/bin:$PATH"
