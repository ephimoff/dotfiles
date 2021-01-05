#!/usr/bin/env bash

# Start
echo "Starting $(basename "$0")"

# Ask for the administrator password upfront
# sudo -v

echo "Closing any open System Preferences panes, to prevent them from overriding settings we’re about to change"
osascript -e 'tell application "System Preferences" to quit'

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General System
###############################################################################
# echo "Set computer name (as done via System Preferences → Sharing)"
# read -r -p "Please enter new hostname _: " _hn

# sudo scutil --set ComputerName "$_hn"
# sudo scutil --set HostName "$_hn"
# sudo scutil --set LocalHostName "$_hn"
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$_hn"


###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

echo "Start week on Monday"
defaults write com.apple.ical "first day of the week" 1


###############################################################################
# Photos                                                                      #
###############################################################################

# echo "Prevent Photos from opening automatically when devices are plugged in"
# defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


###############################################################################
# Firewall
###############################################################################

# echo "Enable the firewall"
# sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# echo "Enable stealth mode"
# sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on


###############################################################################
# Dock, Dashboard, and hot corners
###############################################################################

echo "Top right screen corner → Put display to sleep"
# Hot corners:
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 0


###############################################################################
# TextEdit
###############################################################################

echo "TexEdit: Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0

echo "TexEdit: Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4


###############################################################################
# Messages
###############################################################################

echo "Messages: Disable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
# Trackpad, keyboard
###############################################################################

echo "Trackpad: enable tap to click"
defaults -currentHost write NSGlobalDomain "com.apple.mouse.tapBehavior" -int 1

echo "Trackpad: disable look up"
defaults -currentHost write NSGlobalDomain "com.apple.trackpad.threeFingerTapGesture" -int 0

echo "Trackpad: enable 3 finger drag"
defaults -currentHost write NSGlobalDomain "com.apple.trackpad.threeFingerDragGesture" -int 1

echo "Trackpad: disable swipe between pages"
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

echo "Keyboard: enable full keyboard access for all controls, (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

echo "Keyboard: Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Finder
###############################################################################

echo "Finder: keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Finder: show full path in title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# echo "Finder: when performing a search, search the current folder by default"
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
#

# echo "Finder: use column view in all Finder windows by default"
# # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Avoid creating .DS_Store files on USB Volumes"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Sets default save target to be a local disk, not iCloud"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Show battery percent"
defaults write com.apple.menuextra.battery ShowPercent -bool true

###############################################################################
# Mail
###############################################################################

echo "Mail.app: copy email addresses as \`foo@example.com\` instead of \`Foo Bar <foo@example.com>\`"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

###############################################################################
# Safari & WebKit
###############################################################################

echo "Safari: prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

echo "Safari: Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

###############################################################################
# Screen
###############################################################################

# echo "Screen: Require password immediately after sleep or screen saver begins"
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Screen: Save screenshots to the Pictures directory"
defaults write com.apple.screencapture location -string "${HOME}/Pictures"


echo "Screen: Save screenshots in PNG format"
# (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Finished
echo "$(basename "$0") complete."

