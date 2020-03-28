# .dotfiles [![Twitter Follow](https://img.shields.io/twitter/follow/de_patwoz?style=social)](https://twitter.com/de_patwoz)

> My personal macos setup config.

## 🗃 Usage

```bash
cd ~
git clone git@github.com:patlux/dotfiles.git ./.dotfiles
echo "alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=\$HOME'" >> ~/.zshrc
# all exists files will be overwritten!
dgit reset --hard
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

## 🦸‍♂️⤵️

Created with 🔥 by [@de_patwoz](https://twitter.com/de_patwoz)
