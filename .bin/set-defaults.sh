#!/bin/bash

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# https://macos-defaults.com/dock/tilesize.html

# ------------------------------------------------------------------------------------------------ -
# Apple software: Safari, Updater, iTunes, etc.

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Use AirDrop over every interface.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Check for software updates daily, not just once per week.
defaults write com.assple.SoftwareUpdate ScheduleFrequency -int 1

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# ------------------------------------------------------------------------------------------------ -
# USER INTERFACE

defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""

# Disable animations when opening and closing windows
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Disable animations when opening a Quick Look window.
defaults write -g QLPanelAnimationDuration -float 0

# Accelerated playback when adjusting the window size
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable animations when you open an application from the Dock
defaults write com.apple.dock launchanim -bool false

# Make all animations faster that are used by Mission Control
defaults write com.apple.dock expose-animation-duration -float 0.1

# ------------------------------------------------------------------------------------------------ -
# Interfaces: trackpad, mouse, keyboard, bluetooth, etc.

defaults write -g KeyRepeat -int 2 # "Key Repeat"
defaults write -g InitialKeyRepeat -int 15 # "Delay Until Repeat"

# enable Ctrl + Cmd + Click in any window to move
defaults write -g NSWindowShouldDragOnGesture -bool true

# ------------------------------------------------------------------------------------------------ -
# Screen

# Require password immediately after sleep or screen saver.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable sub-pixel rendering on non-Apple LCDs.
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# ------------------------------------------------------------------------------------------------ -
# SSD

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# ------------------------------------------------------------------------------------------------ -
# DOCK

defaults write com.apple.dock "orientation" -string "right"
defaults write com.apple.dock "tilesize" -int "36"
defaults write com.apple.dock "show-recents" -bool "false"

killall Dock

# $__dir/dock-writeable.sh
# finder
# firefox
# calendar
# notion
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# iterm2
# vscode
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# apple mail
# slack
# franz
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# other apps
# $__dir/dock-readonly.sh

# ------------------------------------------------------------------------------------------------ -
# FINDER

# Show the ~/Library folder.
chflags nohidden ~/Library

# Show hidden files and file extensions by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Disable the warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Allow text-selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# ------------------
# Spotlight

sudo mdutil -i off.

# ------------------------------------------------------------------------------------------------ -

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Defaults are set."
echo "Some changes will not take effect until you reboot your machine."

# See if the user wants to reboot.
function reboot() {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | N | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

# Call on the function
if [[ "Yes" == $(reboot) ]]
then
  echo "Rebooting."
  sudo reboot
  exit 0
else
  exit 1
fi
