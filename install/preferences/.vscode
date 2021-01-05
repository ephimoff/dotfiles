#!/usr/bin/env bash

###############################################################################
# Visual Studio Code
###############################################################################

settingsSource=$HOME/Projects/dotfiles/applications/vscode/settings.json
keybindingsSource=$HOME/Projects/dotfiles/applications/vscode/keybindings.json
vsiconsSource=$HOME/Projects/dotfiles/applications/vscode/vsicons.settings.json
projectsSource=$HOME/Projects/dotfiles/applications/vscode/projects.json
snippetsSource=$HOME/Projects/dotfiles/applications/vscode/snippets/

vsCodeUser=$HOME/Library/Application\ Support/Code/User

settingsTarget=$vsCodeUser/settings.json
keybindingsTarget=$vsCodeUser/keybindings.json
vsiconsTarget=$vsCodeUser/vsicons.settings.json
projectsTarget=$vsCodeUser/projects.json
snippetsTarget=$vsCodeUser/snippets

printf "VS Code: Linking config files\\n"

echo "VS Code: Linking settings.json"
if [[ -f "$settingsSource" ]] ; then
    [[ -f "$settingsTarget" ]] && rm -rf "$settingsTarget"
    ln -s "$settingsSource" "$settingsTarget"
else
    ln -s "$settingsSource" "$settingsTarget"
fi


echo "VS Code: Linking keybindings.json"
if [[ -f "$keybindingsSource" ]] ; then
    [[ -f "$keybindingsTarget" ]] && rm -rf "$keybindingsTarget"
    ln -s "$keybindingsSource" "$keybindingsTarget"
else
    ln -s "$keybindingsSource" "$keybindingsTarget"
fi

echo "VS Code: Linking icons"
if [[ -f "$vsiconsSource" ]] ; then
    [[ -f "$vsiconsTarget" ]] && rm -rf "$vsiconsTarget"
    ln -s "$vsiconsSource" "$vsiconsTarget"
else
    ln -s "$vsiconsSource" "$vsiconsTarget"
fi

printf "VS Code: Linking snippets\\n"
if [[ -d "$snippetsSource" ]] ; then
    echo "VS Code: Remove snippets directory if already exists"
    [[ -d "$snippetsTarget" ]] && rm -rf "$snippetsTarget"

    ln -s "$snippetsSource" "$snippetsTarget"
else
    ln -s "$snippetsSource" "$snippetsTarget"
fi

echo "VS Code: Installing extensions"
xargs -L1 code --install-extension < ~/Projects/dotfiles/applications/vscode/.vscode_extensions

printf "VS Code: Linking porjects list from the Projects extension\\n"
if [[ -f "$projectsSource" ]] ; then
    [[ -f "$projectsTarget" ]] && rm -rf "$projectsTarget"
    ln -s "$projectsSource" "$projectsTarget"
else
    ln -s "$projectsSource" "$projectsTarget"
fi
