#!/usr/bin/env bash

echo "SSH: Configuring hosts (github, localhost etc.)"
[[ ! -d ~/.ssh ]] && mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [[ ! -f ~/.ssh/config ]] ; then
    cat << EOF > ~/.ssh/config
#personal account
Host github.com
	HostName github.com
	User git
  UseKeychain yes
  AddKeysToAgent yes
	IdentityFile ~/.ssh/id_rsa

#auto1 account
Host anton-efimov.github.com
	HostName github.com
	User git
  UseKeychain yes
  AddKeysToAgent yes
	IdentityFile ~/.ssh/id_rsa_auto1
EOF
fi

[[ -f ~/.ssh/config ]] && chmod 600 ~/.ssh/config