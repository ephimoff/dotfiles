#!/usr/bin/env bash
# # Load the shell dotfiles, and then some:
# # * ~/.path can be used to extend `$PATH`.
# for file in ~/.{path,bash_prompt,exports,aliases,functions,extra} ; do
#     # shellcheck disable=SC1090
#     [ -r "$file" ] && [ -f "$file" ] && source "$file"
# done
# unset file

# ulimit -n 1024

# # Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob

# # Append to the Bash history file, rather than overwriting it
# shopt -s histappend

# # Add tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall
# complete -o "nospace" -W "cert config decrypt encrypt help id join keygen list-tracking login logout pull push prove reset revoke revoke-proof search sign status switch track untrack update verify version" keybase
# complete -o "nospace" -W "clean conductor config copy deploy help infrastructure invoke package provision resume retrieve-logs rollback slurp-config ssh status suspend test upgrade version" rgrav

# # Allow ctrl+s to search forward through history
# if [[ $- == *i* ]]; then
#     stty -ixon
# fi

# # If possible, add tab completion for many more commands
# if [[ -f $(brew --prefix)/etc/bash_completion ]] ; then
#     # shellcheck disable=SC1090
#     source "$(brew --prefix)/etc/bash_completion"
# fi

# # ruby env
# if [[ -f /usr/local/bin/rbenv ]] ; then
#     eval "$(rbenv init -)"
# fi

# # python env
# if [[ -f /usr/local/bin/pyenv ]] ; then
#     eval "$(pyenv init -)"
# fi

# if [[ -f $(which -s pyenv-virtualenv-init) ]] ; then
#     eval "$(pyenv virtualenv-init -)"
# fi

# # aws tab completion
# if [[ -f $(which -s aws_completer) ]] ; then
#     complete -C "$(which aws_completer) aws"
# fi
# # Path to the bash it configuration
# export BASH_IT="$HOME/.bash_it"

# # Lock and Load a custom theme file
# # location /.bash_it/themes/
# export BASH_IT_THEME='bobby'

# # (Advanced): Change this to the name of your remote repo if you
# # cloned bash-it with a remote other than origin such as `bash-it`.
# # export BASH_IT_REMOTE='bash-it'

# # Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# # Don't check mail when opening terminal.
# unset MAILCHECK

# # Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# # Set this to the command you use for todo.txt-cli
# export TODO="t"

# # Set this to false to turn off version control status checking within the prompt for all themes
# export SCM_CHECK=true

# # Set Xterm/screen/Tmux title with only a short hostname.
# # Uncomment this (or set SHORT_HOSTNAME to something else),
# # Will otherwise fall back on $HOSTNAME.
# #export SHORT_HOSTNAME=$(hostname -s)

# # Set Xterm/screen/Tmux title with only a short username.
# # Uncomment this (or set SHORT_USER to something else),
# # Will otherwise fall back on $USER.
# #export SHORT_USER=${USER:0:8}

# # Set Xterm/screen/Tmux title with shortened command and directory.
# # Uncomment this to set.
# #export SHORT_TERM_LINE=true

# # Set vcprompt executable path for scm advance info in prompt (demula theme)
# # https://github.com/djl/vcprompt
# #export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# # (Advanced): Uncomment this to make Bash-it reload itself automatically
# # after enabling or disabling aliases, plugins, and completions.
# # export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# # Load Bash It
# # shellcheck disable=SC1090
# source "$BASH_IT"/bash_it.sh
