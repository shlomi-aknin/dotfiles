set clipboard+=unnamedplus
set cursorline
syntax enable
set hidden
set number
set termguicolors
set lazyredraw
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:airline_powerline_fonts = 1
let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let g:system_copy#copy_command='xclip -sel clipboard'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
set nocompatible
set runtimepath^=/home/shlomo/.local/share/nvim/site/autoload/coc.nvim/autoload
filetype plugin indent on
