#!/bin/sh

defaults write com.apple.Dock contents-immutable -bool no
defaults write com.apple.Dock position-immutable -bool no
defaults write com.apple.Dock size-immutable -bool no
killall Dock
