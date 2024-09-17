return {
  'sbdchd/neoformat',
  config = function()
    vim.cmd[[
      augroup fmt
      autocmd!
      autocmd BufWritePre *.js,*.ts undojoin | Neoformat
      augroup END
    ]]
  end,
  opts = {},
}
