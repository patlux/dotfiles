#!/bin/sh

# Setup .dotfiles
echo "alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=\$HOME'" >> ~/.zshrc
dgit reset --hard

# Install brew

xcode-select --install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Installing Applications

brew install git
brew install git-flow
brew install gnupg
brew install pinentry-mac
brew install jq
brew install translate-shell
brew install scrcpy
brew install guetzli
brew install htop
brew install watchman
brew install mas

### Installing Java

brew tap adoptopenjdk/openjdk
brew cask install adoptopenjdk8

### Installing Fonts

brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono

### Installing Other

brew tap homebrew/cask

# bitwarden
brew cask install bitwarden
bw config server http://192.168.178.5:7277
bw login email@patwoz.de
# enter password
# enter 2fa code
# TODO: export BW_SESSION=""

brew cask install iterm2
brew cask install gpg-suite
brew cask install notion
brew cask install visual-studio-code
brew cask install firefox
brew cask install google-chrome
brew cask install franz
brew cask install slack
brew cask install shimo
brew cask install insomnia
brew cask install gimp
brew cask install android-studio
brew cask install android-file-transfer
brew cask install react-native-debugger
brew cask install figma
brew cask install robo-3t
brew cask install teamviewer
brew cask install virtualbox
brew cask install docker
brew cask install alfred
brew cask install knockknock
brew cask install blockblock
brew cask install kap
brew cask install discord
brew cask install vlc
brew cask install sabnzbd
brew cask install mtmr
brew cask install appcleaner
brew cask install little-snitch
brew cask install micro-snitch
brew cask install shimo
brew cask install itsycal
brew cask install balenaetcher
brew cask install imageoptim
brew cask install pixelsnap

brew tap homebrew/cask-drivers
brew cask install logitech-options


### App Store

mas install 497799835brew cask install # Xcode (11.4)
mas install 441258766brew cask install # Magnet (2.4.5)
mas install 425424353  # The Unarchiver (4.2.0)
mas install 1452453066 # Hidden Bar (1.5)
mas install 937984704  # Amphetamine (5.0.1)

### Node

mkdir ~/.bin
curl -L https://git.io/n-install | N_PREFIX=$HOME/.bin/n bash -y
~/.bin/fix-firewall-node.sh

npm install -g \
	spaceship-prompt yarn npm-check-updates now maildev \
	expo-cli diff-so-fancy @bitwarden/cli mrm
