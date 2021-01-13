" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

call plug#begin('~/.config/nvim/autoload/plugged')

  " A collection of language packs
  Plug 'sheerun/vim-polyglot'
  " Color Theme
  Plug 'ayu-theme/ayu-vim'
  " Search files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Makes nvim as smart as vscode
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " File explorer
  Plug 'preservim/nerdtree'
  " Ctrl-P
  Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
