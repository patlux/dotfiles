# Setup a new macOS

TODO: clearify when to login into icloud. needed for icloud keychain

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

### Install Xcode command line tools

Open Terminal via Spotlight (CMD + Space)

Install xcode command line tools

```sh
xcode-select --install
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
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Install darwin module (adds configurations options for macos)
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer

# Would you like to edit the default configuration.nix before starting? [y/N] N
# Would you like to manage <darwin> with nix-channel? [y/N] y
```

### Setup dotfiles

```sh
cd ~/
git clone https://github.com/patlux/dotfiles.git .dotfiles
cd .dotfiles
./.bin/dotfiles-bootstrap.sh
# On VirtualBuddy: rm -f Library/LaunchAgents/de.patwoz.KeyRemapping.plist
# Otherwise ESC will not work

darwin-rebuild switch
home-manager switch # creates the ~/.zshrc
```

### Install tools

```sh
curl https://mise.run | sh
# close and open new terminal
mise install

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
2) Customize install to not modify path

cd ~/.dotfiles
brew bundle

yabai --start-service

# https://github.com/MattiSG/adblock
sudo adblock on

# Install lunarvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

### Setup Raycast

Replace Spotlight with Raycast

1. Disable spotlight shortcut
![CleanShot 2024-02-10 at 00 49 53@2x](https://github.com/patlux/dotfiles/assets/4481570/1ae0b66d-18c0-482d-94f8-71f8a2542603)
2. Open Raycast and setup shortcut

Switch Keyboard Layout for Dygma Keyboard

![CleanShot 2023-03-27 at 10 46 01](https://github.com/patlux/dotfiles/assets/4481570/291b8e51-e965-494d-92c3-dd7183c807e5)

![CleanShot 2023-03-27 at 10 46 48](https://github.com/patlux/dotfiles/assets/4481570/2be86882-a5ae-4f63-b653-a17de2876fc9)

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
cd ~/dev
duplicacy list
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

### Setup Mounts

1. Open Finder
2. Open "Go" > "Connect to server..."
3. Enter `afp://syno.camel-yo.ts.net`
4. Authenticate

### Other

TODO: Setup Little Snitch
