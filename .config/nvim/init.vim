let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-yaml', 'coc-tailwindcss', 'coc-flow', 'coc-prettier']

source $HOME/.config/nvim/vim-plug/plugins.vim

" See: https://github.com/neoclide/coc.nvim#example-vim-configuration 
source $HOME/.config/nvim/coc-config.vim

set termguicolors
let ayucolor="mirage"
colorscheme ayu

set number

set hidden
let mapleader=","
nnoremap <Leader>v :e $MYVIMRC<cr>

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$'] 

" NerdTree plugin
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" coc-prettier
" Add command :Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
