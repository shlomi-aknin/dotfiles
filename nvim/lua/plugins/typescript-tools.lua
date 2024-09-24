return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  branch = "master",
  opts = {
    expose_as_code_action = { "all" },
  },
}
