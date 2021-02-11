#!/usr/bin/env bash
# Start
echo "Starting $(basename "$0")"

echo "Installing oh-my-zsh (http://ohmyz.sh)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# echo "Instaling oh-my-zsh theme: powerlevel9k (see https://github.com/bhilburn/powerlevel9k for more info)"
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "Instaling zsh-autosuggestions plugin"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Instaling zsh-syntax-highlighting plugin"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "Making zsh default shell"
chsh -s /bin/zsh

# Finished
echo "$(basename "$0") complete."
