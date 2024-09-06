return {
  'sbdchd/neoformat',
  config = function()
    -- autocmd BufWritePre * undojoin | Neoformat prettierd | Neoformat eslint_d
    vim.cmd[[
      augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
      augroup END
    ]]
    -- vim.g.neoformat_enabled_typescript = { 'eslint_d', 'prettierd' }
  end,
  opts = {},
}
