vim.cmd([[
  let $PATH .= ':/usr/local/lib/node_modules/bin'
  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{ higroup='IncSearch', timeout=700 }
  augroup END
  augroup Format
      autocmd!
      autocmd BufWritePost * FormatWrite
      autocmd BufWritePost * TSBufEnable highlight
  augroup END
]])
