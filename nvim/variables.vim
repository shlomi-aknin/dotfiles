autocmd FileType html EmmetInstall
autocmd StdinReadPre * let s:std_in=1
filetype plugin indent on
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <SPACE> <Nop>
let mapleader=' '
let g:airline_theme='cobalt2'
let g:airline_powerline_fonts = 1
let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
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
let g:user_emmet_install_global = 0
let g:buffet_always_show_tabline = 0
let g:buffet_powerline_separators = 1
let g:buffet_separator = ''
let g:buffet_show_index = 1
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-json',
      \'coc-snippets',
      \'coc-tsserver'
      \]
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
set mouse=a
syntax enable

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

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

function! Multiple_cursors_before()
  call AutoPairsToggle()
endfun

function! Multiple_cursors_after()
  call AutoPairsToggle()
endfun
