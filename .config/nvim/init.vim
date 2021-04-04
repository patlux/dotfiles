" vim:foldmethod=marker:foldlevel=0

" Polyglot {{{
" not working, so disable:
let g:vim_markdown_conceal_code_blocks = 0
let g:polyglot_disabled = ['markdown']
" }}}

" Plugins {{{

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

call plug#begin('~/.config/nvim/autoload/plugged')

  " Color Theme
  Plug 'sainnhe/sonokai'
  " A collection of language packs
  Plug 'sheerun/vim-polyglot'
 " Search files
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Makes nvim as smart as vscode
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Search project files
  Plug 'mileszs/ack.vim'
  " Statusbar
  Plug 'itchyny/lightline.vim'
  Plug 'josa42/vim-lightline-coc'
  " Surround
  Plug 'tpope/vim-surround'
  " Highlighting colors
  Plug 'chrisbra/colorizer'
  " JsDoc
  Plug 'heavenshell/vim-jsdoc', { 
    \ 'for': ['javascript', 'javascriptreact','typescript', 'typescriptreact'], 
    \ 'do': 'make install'
  \}
  " git
  Plug 'tpope/vim-fugitive'
  " quick-scope
  Plug 'unblevable/quick-scope'
  " keybindings helper
  Plug 'liuchengxu/vim-which-key'
  " Show indent level lines
  Plug 'Yggdroot/indentLine'

 call plug#end()

" }}}

" Statusbar {{{
let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" register compoments:
call lightline#coc#register()

set laststatus=2          " Always show status bar
set cmdheight=1           " Show 1 line for statusbar
set noshowmode
" }}}

" Appearance {{{
if has('termguicolors')
  set termguicolors
endif
syntax on
let g:sonokai_style = 'atlantis'
colorscheme sonokai
" }}}

" Mappings {{{
let mapleader=","
nnoremap <Leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Buffer
" https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Mappings to transform text
inoremap <c-d> <esc>ddi
" Uppercase word
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" Copy to clipboard with capital Y in visual mode
noremap Y "*y

" Moving around between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" :W behaves like :w
cnoreabbrev W w

" fzf
nnoremap <Leader>d :Files<cr><Space>

" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>

" }}}

" coc {{{
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-git',
  \ 'coc-yaml',
  \ 'coc-tailwindcss',
  \ 'coc-flow',
  \ 'coc-prettier',
  \ 'coc-rls',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-jest',
  \ 'coc-snippets',
  \ 'coc-go'
  \ ]

" See: https://github.com/neoclide/coc.nvim#example-vim-configuration 
source $HOME/.config/nvim/coc-config.vim

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" }}}

" Defaults {{{
set autoread              " Automatically re-read files if unmodified inside Vim
set title                 " Show the filename in the window title bar
set hidden                " Hide files in the background instead of closing them
set updatetime=300        " The length of time Vim waits after you stop typing before it triggers the plugin

" Display
set number
set norelativenumber
set cursorline            " highlight current line
set scrolloff=5           " display some extra lines at the bottom
set ttyfast               " make scrolling faster
set lazyredraw            " even faster scrolling 
set ruler                 " show line for max length
set colorcolumn=120       " max length 120 characters
set background=dark       " Use colors that suit a dark background
set showcmd
set showmatch             " Show matching closing brackets
set showbreak=↪\
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set listchars+=eol:¬
" format text
 set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set autoindent

set hlsearch      " highlight search matches
set incsearch     " higlight on search
set ignorecase
set smartcase     " Automatically switch search to case-sensitive when search query contains an uppercase letter
nnoremap <CR> :noh<CR><CR>

" Avoid backups and extra files creation
set backupdir=~/.vim/backups/,/tmp/
set directory=~/.vim/swp/,/tmp/
set undodir=~/.vim/undo/,/tmp/

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/opt/homebrew/bin/python'
" }}}

" ack.vim {{{
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" reopen
nnoremap <Leader>p :copen<cr>
" }}}

" File Types {{{

" Rust
let g:rustfmt_autosave = 1 

" Overwrite .js with javascriptreact
augroup filetype_jsx
  autocmd!
  autocmd FileType javascript set filetype=javascriptreact
augroup END

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1 
" }}}

" File Explorer {{{
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2 
let g:netrw_winsize = 25

:nmap <space>f :CocCommand explorer<CR>
" }}}

" quick-scope {{{

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" }}}

" Which key {{{
nnoremap <silent> <Space> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader> :WhichKey ','<CR>
" }}}

