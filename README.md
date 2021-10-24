# .dotfiles [![Twitter Follow](https://img.shields.io/twitter/follow/de_patwoz?style=social)](https://twitter.com/de_patwoz)

> My personal macos setup config.

## 🗃 Usage

```bash
cd ~
git clone git@github.com:patlux/dotfiles.git ./.dotfiles
echo "alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=\$HOME'" >> ~/.zshrc
# WARNING: all exists files will be overwritten!
dgit reset --hard
```

## Sync

Will synchronize all files in your home folder to `.dotfiles/`

```bash
./.bin/dotfiles-sync.sh
```

## ✨ Bootstrapping

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
```

## Keyboard bindings

### Window Management

Controlled by [skhd](https://github.com/koekeishiya/skhd). Managed by [yabai](https://github.com/koekeishiya/yabai).

| Shortcut                   | Description          |
| -------------------------- | -------------------- |
| `alt` + `hjkl`             | Switch focus         |
| `lctrl` + `cmd` + `hjkl`   | Swap windows         |
| `alt` + `s`                | Toggle splitting     |
| `alt` + `shift` + `hjkl`   | Increase window size |
| `lctrl` + `shift` + `hjkl` | Decrease window size |
| `alt` + `shift` + `0`      | Balance windows      |

### Vim

| Shortcut         | Description  |
| ---------------- | ------------ |
| `lctrl` + `hjkl` | Switch focus |

### Mappings

Controlled by [hidutil](https://developer.apple.com/library/archive/technotes/tn2450/_index.html).

| Shortcut                             | Description                                                       |
| ------------------------------------ | ----------------------------------------------------------------- |
| `right cmd` mapped to `right option` | To enter `@` (because Keychron v2 doesn't have a right option key |
| `capslock` mapped to `esc`           | Easier access to `esc`                                            |
| `esc` mapped to `^`                  | Easier to enter something like `^g` :)                            |

### Others

#### Adblock

To block ads I'm using [MattiSG/adblock](https://github.com/MattiSG/adblock) as listed in `Brewfile`:

```bash
brew install mattisg/mattisg/adblock
# enable:
sudo adblock on
```

### Maintenance

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


## 🦸‍♂️⤵️

Created with 🔥 by [@de_patwoz](https://twitter.com/de_patwoz)
