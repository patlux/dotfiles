#!/bin/sh

defaults write com.apple.Dock contents-immutable -bool yes
defaults write com.apple.Dock position-immutable -bool yes
defaults write com.apple.Dock size-immutable -bool yes
killall Dock
