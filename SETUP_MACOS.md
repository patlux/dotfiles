# Setup a new macOS

## Setup

- Language: English
- Country/Region: Germany
- Written/Spoken language: Customize Settings
- Preferred Language: English
- Input Sources: "+" -> "German" -> "ABC QWERTZ" (Remove German and US from the lis)
- Skip Backups
- Account name: patwoz
- Enable Location Services (Important for FindMe later)
- Skip Screen Time
- Skip Siri


## After Setup (Desktop)

### Activate FileVault

Open System Settings and make sure FileVault is active.

### (Optional) VirtualBuddy

If you do this on "VirtualBuddy", don't forget to start "VirtualBuddyGuest":

1. Open Finder
2. Open "Guest" under "Locations" in the left side menu
3. Run "VirtualBuddyGuest"

For Copy/Paste between Host and Virtual Machine.

Also run the following to optimize the vm:

See https://github.com/sickcodes/osx-optimizer for more.

```sh
# Skip the GUI login screen
defaults write com.apple.loginwindow autoLoginUser -bool true

# Disable motion and transparency 
defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1

# Multi session
sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE
defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true

# Disable updates
sudo su
defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false
defaults write com.apple.commerce AutoUpdate -bool false
defaults write com.apple.commerce AutoUpdateRestartRequired -bool false
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 0
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 0
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 0
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 0

# Enable osascript over SSH automatically without sshd-keygen warning and full disk access
defaults write com.apple.universalaccessAuthWarning /System/Applications/Utilities/Terminal.app -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec/sshd-keygen-wrapper -bool true
defaults write com.apple.universalaccessAuthWarning com.apple.Messages -bool true
defaults write com.apple.universalaccessAuthWarning com.apple.Terminal -bool true

# Disable lock screen
defaults write com.apple.loginwindow DisableScreenLock -bool true

# Disable saving the application state on shutdown
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
```

### Install Xcode command line tools

Open Terminal via Spotlight (CMD + Space)

Install xcode command line tools

```sh
xcode-select --install
sudo xcode-select --switch /Library/Developer/CommandLineTools

# If Xcode is installed
sudo xcodebuild -license
```

### Setup brew & nix

Install brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install nix (https://nixos.org/download.html#nix-install-macos)

```sh
# Optionally
sudo rm -f /etc/bashrc.backup-before-nix
sudo rm -f /etc/zshrc.backup-before-nix
sudo rm -f /etc/bash.bashrc.backup-before-nix
sudo rm -f /etc/nix/nix.conf

# Required
sh <(curl -L https://nixos.org/nix/install)

# Enter 4x "y"
# Enter Password

# When done, close the current and open a new terminal
```

Install home-manager (https://github.com/LnL7/nix-darwin)

```sh
# Make sure you logged out and logged in again

# Install home-manager (adds configurations options for home)
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
# If error occurs, check the error if there is something wrong in $HOME/.config/home-manager/configuration.nix

# Install darwin module (adds configurations options for macos)
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A darwin-rebuild
./result/bin/darwin-rebuild switch -I darwin-config=$HOME/.config/nix-darwin/configuration.nix
```

### Setup dotfiles

```sh
cd ~/
git clone https://github.com/patlux/dotfiles.git .dotfiles
cd .dotfiles
./.bin/dotfiles-bootstrap.sh
# On VirtualBuddy: rm -f Library/LaunchAgents/de.patwoz.KeyRemapping.plist
# Otherwise ESC will not work

# If not already done, open a new terminal window to make it work
darwin-rebuild switch
home-manager switch # creates the ~/.zshrc
```

### Install tools

```sh
curl https://mise.run | sh
# close and open new terminal
mise install

# install gems (cocoapods)
bundle install 

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
2) Customize install to not modify path

cd ~/.dotfiles
brew bundle

yabai --start-service
skhd --start-service

# https://github.com/MattiSG/adblock
sudo adblock on
npm install -g tree-sitter-cli
```

Setup `llm`: 

```sh
uv tool install llm
llm install llm-cmd
llm install llm-jq
llm install llm-deepseek
llm keys set deepseek
# <Paste key here>
```

### Setup Keyboard

#### Hide Menu Bar Entry

1. `System Settings`
2. `Keyboard`
3. `Input Sources` `Edit...`
4. Uncheck `Show Input menu in menu bar`

#### Raycast

`System Settings` > `Keyboard` > `Keyboard Shortcuts...`

Replace Spotlight with Raycast

1. Disable spotlight shortcut
![CleanShot 2024-02-10 at 00 49 53@2x](https://github.com/patlux/dotfiles/assets/4481570/1ae0b66d-18c0-482d-94f8-71f8a2542603)
2. Open Raycast and setup shortcut

#### Dygma Keyboard

**Fix keyboard type**

macOS won't detect the correct german quertz keyboard with the `<>` keys at the first. 

To fix this run:

```sh
rm -f /Library/Preferences/keyboardtype.plist
```

Now reboot. After reboot:

`System Settings` > `Keyboard` > `Change Keyboard Type...` > Finish the process

**Swap `Option` and `Command` key**

`System Settings` > `Keyboard` > `Keyboard Shortcuts...`

![CleanShot 2024-03-12 at 17 04 06](https://github.com/patlux/dotfiles/assets/4481570/c3f22bd9-ef08-48fe-9985-e5f66388e8ac)

# Setup tailscale

This is required for the next steps. Don't skip.

1. Open Tailscale (via Raycast)
2. Login

### Setup bitwarden

This is required for the next steps. Don't skip.

1. Open Bitwarden
2. Choose Self-Hosted Environment
3. Enter the URL `https://syno.camel-yo.ts.net:7277`
4. Open Safai > Settings > Extensions > Download the Bitwarden Extension

### Setup home folder

gpg, .ssh, .npmrc, .yarnrc

> See `./BACKUP_MACOS.md`

```sh
cd ~/
duplicacy list
# Enter password from "Synology NAS (Web/SSH)" when asking for SAMBA password
# Enter password from "duplicacy" when asking for storage password
duplicacy restore -r <revision> "*"
# with overwrite existing files:
duplicacy restore -overwrite -r <revision> "*"
```

### Setup dev folder

> See `./BACKUP_MACOS.md`

```sh
cd ~/dev
duplicacy list
duplicacy restore -r <revision> "piparo.tech/*"
```

### Setup ARC

1. Open ARC
2. Settings
3. Login

### Setup Android

1. Launch Android Studio (via Raycast)
2. Make the setup
3. This will install a initial sdk under `~/Library/Android/sdk`
4. "Settings..." -> "Languages & Frameworks" -> "Android SDK"
5. Checkmark "Android SDK Command-line Tools (latest)"
6. Apply

### Setup Mounts

1. Open Finder
2. Open "Go" > "Connect to server..."
3. Enter `afp://syno.camel-yo.ts.net`
4. Authenticate

### Other

#### Install "Apple WWDR certificate"

Download [Certificate](https://www.apple.com/certificateauthority/AppleWWDRCAG3.cer)

```sh
cd ~/Downloads
sudo security import AppleWWDRCAG3.cer -k /Library/Keychains/System.keychain
```

This fixes `Distribution certificate with fingerprint EAF3A00C1FC18283CACFEDC21AD6BB37EB993438 hasn't been imported successfully`

#### TODO: Setup Little Snitch
