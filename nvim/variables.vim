set clipboard+=unnamedplus
set cursorline
syntax enable
set hidden
set number
set termguicolors
set lazyredraw
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:airline_powerline_fonts = 1
let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:closetag_filenames = '*.html,*.xhtml,*.php,*.json'
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let g:nnn#action = { '<c-t>': 'tab split', '<c-x>': 'split', '<c-v>': 'vsplit' }
let g:nnn#layout = 'new tab'
let g:system_copy#copy_command='xclip -sel clipboard'

set nocompatible
set runtimepath^=/home/shlomo/.local/share/nvim/site/autoload/coc.nvim/autoload
filetype plugin indent on
syntax on
set hidden
