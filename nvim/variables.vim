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
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_cursor_delay = 50
let g:vista_close_on_jump = 1
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]
let g:vista_ignore_kinds = ['classes', 'constants', 'properties', 'global variables']
let g:vista_fzf_preview = ['right:50%']
set nocompatible
set runtimepath^=/home/shlomo/.local/share/nvim/site/autoload/coc.nvim/autoload
filetype plugin indent on
