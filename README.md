# .dotfiles [![Twitter Follow](https://img.shields.io/twitter/follow/de_patwoz?style=social)](https://twitter.com/de_patwoz)

> My personal macos setup config.

## Usage

### 🥇 Getting started

How to use this for the first time:

```bash
cd ~
git clone git@github.com:patlux/dotfiles.git ./.dotfiles
echo "alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=\$HOME'" >> ~/.zshrc

# WARNING: all exists files will be overwritten!
dgit reset --hard
```

###  Update

```bash
cd ~/.dotfiles
git pull origin main
dgit reset --hard
```

###  Sync

After changing files in your home folder, you want to sync the changes back into `.dotfiles`:

```bash
./.bin/dotfiles-sync.sh
```

## Keyboard bindings

### Window Management

* Controlled by [skhd](https://github.com/koekeishiya/skhd): `~/.config/skhd/skhdrc`
* Managed by [yabai](https://github.com/koekeishiya/yabai): `~/.config/yabai/yabairc`

| Shortcut                   | Description          |
| -------------------------- | -------------------- |
| `alt` + `hjkl`             | Switch focus         |
| `lctrl` + `cmd` + `hjkl`   | Swap windows         |
| `alt` + `s`                | Toggle splitting     |
| `alt` + `shift` + `hjkl`   | Increase window size |
| `lctrl` + `shift` + `hjkl` | Decrease window size |
| `alt` + `shift` + `0`      | Balance windows      |

### [LunarVim](https://www.lunarvim.org/)

I'm using LunarVim as my main editor for programming, editing and writing.

`~/.config/lvim/config.lua`

| Shortcut         | Description  |
| ---------------- | ------------ |
| `lctrl` + `hjkl` | Switch focus |

### [wezterm](https://wezfurlong.org/wezterm)

`wezterm` is my primary used terminal. It has built-in support for tabs and it's known for it's speed.

`~/.config/wezterm/wezterm.conf`

| Shortcut         | Description  |
| ---------------- | ------------ |
| `ctrl` + `,` | Switch to previous tab |
| `ctrl` + `shift` + `,` | Move tab backwards |
| `ctrl` + `.` | Switch to next tab |
| `ctrl` + `shift` + `,` | Move tab forwards |
| `cmd` + `t` | Create new tab |
| `cmd` + `n` | Create new window with current directory |

### System Mappings

Controlled by [hidutil](https://developer.apple.com/library/archive/technotes/tn2450/_index.html).

`~/Library/LaunchAgents/de.patwoz.KeyRemapping.plist`

| Shortcut                             | Description                                                       |
| ------------------------------------ | ----------------------------------------------------------------- |
| `right cmd` mapped to `right option` | To enter `@` (because Keychron v2 doesn't have a right option key |
| `capslock` mapped to `esc`           | Easier access to `esc`                                            |
| `esc` mapped to `^`                  | Easier to enter something like `^g` :)                            |

Use the [online tool](https://hidutil-generator.netlify.app) to generate the json.

## Others

### Adblock

To block ads I'm using [MattiSG/adblock](https://github.com/MattiSG/adblock) as listed in `Brewfile`:

```bash
brew install mattisg/mattisg/adblock
# enable:
sudo adblock on
```

## System Maintenance

### Updates

#### `nixos`

```bash
home-manager switch
```

#### `brew`

```bash
# check for updates
brew update

# install updates
brew upgrade
```

#### `node`

```bash
# check for updates
ncu -g

# install updates
~/.bin/install-node-packages.sh
```

#### [LunarVim](https://www.lunarvim.org/)

```bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# force update:
rm -rf ~/.local/share/lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

## ✨ Bootstrapping

These describes the steps I did to create the `.dotfiles` folder:

```bash
echo "alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=\$HOME'" >> ~/.zshrc

cd ~
mkdir .dotfiles
cd .dotfiles
git init .
echo "*" > .gitignore
git add -f .gitignore
git commit -m "🔥"
cd ~
dgit reset --hard

# now copy all files which should be stored in git into .dotfiles/
# then force add them to git
git add -f <files>
```

## 🦸‍♂️⤵️

Created with 🔥 by [@de_patwoz](https://twitter.com/de_patwoz)
