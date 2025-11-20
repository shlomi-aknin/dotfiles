return {
  "williamboman/mason.nvim",
  opts = {},
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      ensure_installed = { "eslint_d", "ts_ls" },
      automatic_installation = true,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "mfussenegger/nvim-dap" },
      opts = {
        ensure_installed = { "js" },
        automatic_installation = true,
        handlers = {},
      },
    }
  }
}
