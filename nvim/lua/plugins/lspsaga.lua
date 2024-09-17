return {
  'nvimdev/lspsaga.nvim',
  opts = {
    lightbulb = {
      enable = false,
      virtual_text = false,
      sign = false,
    },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  }
}
