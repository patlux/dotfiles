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

set nu relativenumber
set cursorline " highlight current line

set hls          "highlight search matches
set is           "higlight on search
nnoremap <CR> :noh<CR><CR>

" Copy to clipboard with capital Y in visual mode
noremap Y "*y

" Overwrite .js with javascriptreact
augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END

" Moving around between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Avoid backups and extra files creation
set nowritebackup
set noswapfile
set nobackup

" vim-javascript (included in vim-polygot)
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$']

" NerdTree plugin
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" coc-prettier
" Add command :Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Ctrl-P
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
let g:ctrlp_use_caching = 0


