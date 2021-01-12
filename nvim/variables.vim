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

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use <c-space> to trigger completion.
"
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>y  :<C-u>CocList -I symbols<cr>

