autocmd FileType html EmmetInstall
autocmd StdinReadPre * let s:std_in=1
filetype plugin indent on
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <SPACE> <Nop>
let mapleader=' '
let g:airline_theme='base16_spacemacs'
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
let g:beacon_minimal_jump = 1
let g:beacon_timeout = 1000
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0
let g:any_jump_ignored_files = ['*.json', '*ignore', 'test/**', 'node_modules', 'node_modules/**', '.git']
let g:any_jump_results_ui_style = 'filename_last'
let g:any_jump_colors = { "help": "Function" }
let g:any_jump_references_only_for_current_filetype = 1
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let php_sql_query = 1
let php_sql_heredoc = 0
let php_sql_nowdoc = 0
let php_html_in_strings = 1
let php_html_in_heredoc = 0
let php_html_in_nowdoc = 0
let php_parent_error_close = 1
" let php_parent_error_open = 1
let php_var_selector_is_identifier=1
let g:fzf_colors = {
\ 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Keyword'],
\ 'fg+': ['fg', 'Normal'],
\ 'bg+': ['bg', 'Normal'],
\ 'hl+': ['fg', 'DraculaOrange'],
\ 'info': ['fg', 'DraculaPurple'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'DraculaGreen'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 3.7)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -3.7)<CR>
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-json',
      \'coc-snippets',
      \'coc-tsserver',
      \'coc-tabnine'
      \]
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>y  :<C-u>CocList -I symbols<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
set clipboard+=unnamed
set clipboard+=unnamedplus
set cursorline
set guifont=Source\ Code\ Pro:h18
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
set mouse=a
set scrolloff=999
syntax enable

command! -bang -nargs=* RgFzf
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

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
