vim.cmd([[
  let $PATH .= ':/usr/local/lib/node_modules/bin:~/.local/share/nvim/lsp_servers'
  let g:vim_matchtag_enable_by_default = 1
  let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp'
  autocmd Syntax css,html,js,php normal zR
  autocmd BufReadPost quickfix nnoremap <buffer> <C-j> <cmd>QFNext<cr><C-w>j
  autocmd BufReadPost quickfix nnoremap <buffer> <C-k> <cmd>QFPrev<cr><C-w>j
  autocmd BufReadPost quickfix nnoremap <buffer> <C-l> <cr>
  autocmd BufReadPost quickfix nnoremap <buffer> <C-u> <cmd>call setqflist([])<cr><cmd>cclose<cr>
  au! BufNewFile,BufRead *.svelte set ft=svelte

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
