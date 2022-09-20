vim.api.nvim_exec([[
  let g:VM_maps = {}
  let $PATH .= ':/usr/local/lib/node_modules/bin:~/.local/share/nvim/lsp_servers:~/.local/bin'
  let g:vim_matchtag_enable_by_default = 1
  let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp'
  let g:VM_maps['Add Cursor Down']    = '<C-A-j>'   " new cursor down
  let g:VM_maps['Add Cursor Up']      = '<C-A-k>'   " new cursor up
  let g:VM_maps['Add Cursor At Pos']  = '<C-A-g>'   " add cursor at position
  let g:VM_maps['Select l']           = '<C-A-l>'   " select right
  let g:VM_maps['Select h']           = '<C-A-h>'   " select left
  set statusline=\ %f%m%R%=%y\ %l/%L\ (%p%%),\ %c
  set guifont=SauceCodePro\ Nerd\ Font:h10
  autocmd Syntax css,html,js,php normal zR
  autocmd BufReadPost quickfix nnoremap <buffer> <C-j> <cmd>QFNext<cr><C-w>j
  autocmd BufReadPost quickfix nnoremap <buffer> <C-k> <cmd>QFPrev<cr><C-w>j
  autocmd BufReadPost quickfix nnoremap <buffer> <C-l> <cr>
  autocmd BufReadPost quickfix nnoremap <buffer> <C-u> <cmd>call setqflist([])<cr><cmd>cclose<cr>
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  autocmd CursorMoved * echo
  au! BufNewFile,BufRead *.svelte set ft=svelte
  autocmd FileType dap-float nnoremap <buffer> za <cmd>lua require('dap.ui').trigger_actions({ mode = 'first' })<cr><cmd>set number relativenumber cursorline<cr>

  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{ higroup='Folded', timeout=800 }
  augroup END

  augroup Format
      autocmd!
      autocmd BufWritePost * FormatWrite
      autocmd BufWritePost * TSBufEnable highlight
  augroup END

  function! s:QuickFixOpenAll()
    let files = {}
    for entry in getqflist()
    let filename = bufname(entry.bufnr)
    silent exe "edit " . filename
    endfor
  endfunction

  command! QuickFixOpenAll call s:QuickFixOpenAll()
]], true)
