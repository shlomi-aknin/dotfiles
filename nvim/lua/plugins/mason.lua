return {
  "williamboman/mason.nvim",
  opts = {},
  dependencies = {
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
