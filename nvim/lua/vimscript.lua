vim.cmd([[
  let $PATH .= ':/usr/local/lib/node_modules/bin'
  au BufEnter *.{css,html,js,php} :norm zX<CR>
  autocmd BufReadPost quickfix nnoremap <buffer> <C-j> :QFNext<cr><C-w>j
  autocmd BufReadPost quickfix nnoremap <buffer> <C-k> :QFPrev<cr><C-w>j
  autocmd BufReadPost quickfix nnoremap <buffer> <C-l> <cr>
  autocmd BufReadPost quickfix nnoremap <buffer> <C-u> :call setqflist([])<cr>:cclose<cr>
  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{ higroup='Folded', timeout=800 }
  augroup END
  augroup Format
      autocmd!
      autocmd BufWritePost * FormatWrite
      autocmd BufWritePost * TSBufEnable highlight
  augroup END
]])
