# Setup a new macOS

## Setup

- Skip Siri
- Skip Screen Time
- Skip Backups

Account name: patwoz

## After Setup (Desktop)

```sh
cd ~/
git clone https://github.com/patlux/dotfiles.git .dotfiles
cd .dotfiles
./.bin/dotfiles-bootstrap.sh
```

Install xcode command line tools

```sh
xcode-select --install
```

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

# Important: Logout and Login
```

Install home-manager (https://github.com/LnL7/nix-darwin)

```sh
# Make sure you logged out and logged in again

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer

nix-shell '<home-manager>' -A install
home-manager switch # creates the ~/.zshrc
```

Install tools

```sh
curl https://mise.run | sh
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

./.bin/set-defaults.sh # will reboot
```

Replace Spotlight with Raycast

1. Disable spotlight shortcut
![CleanShot 2024-02-10 at 00 49 53@2x](https://github.com/patlux/dotfiles/assets/4481570/1ae0b66d-18c0-482d-94f8-71f8a2542603)
2. Open Raycast and setup shortcut

Switch Keyboard Layout for Dygma Keyboard

![CleanShot 2023-03-27 at 10 46 01](https://github.com/patlux/dotfiles/assets/4481570/291b8e51-e965-494d-92c3-dd7183c807e5)

![CleanShot 2023-03-27 at 10 46 48](https://github.com/patlux/dotfiles/assets/4481570/2be86882-a5ae-4f63-b653-a17de2876fc9)

Setup tailscale

Setup bitwarden

Setup gpg

