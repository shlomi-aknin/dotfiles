autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
filetype plugin indent on
inoremap <silent><expr> <c-space> coc#refresh()
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
let g:gitgutter_map_keys = 0
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>y  :<C-u>CocList -I symbols<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
set clipboard+=unnamedplus
set cursorline
set hidden
set number
set termguicolors
set lazyredraw
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible
set updatetime=300
set runtimepath^=/home/shlomo/.local/share/nvim/site/autoload/coc.nvim/autoload
set cmdheight=2
set shortmess+=c
syntax enable

if has('patch-8.1.1564')
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
