return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {'folke/neodev.nvim' },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        "lua_ls",
        "sqls",
        "eslint",
       "ts_ls",
      }
    })


    local base_on_attach = vim.lsp.config.eslint.on_attach

    vim.lsp.config("eslint", {
      on_attach = function(client, bufnr)
        if not base_on_attach then return end

        base_on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "LspEslintFixAll",
        })
      end,
    })

    vim.lsp.enable('lua_ls') -- Enable the server
    vim.lsp.enable('eslint') -- Enable the server
    vim.lsp.enable('ts_ls') -- Enable the server
  end
}
