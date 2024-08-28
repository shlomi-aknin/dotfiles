local actions = require('telescope.actions')

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      mappings = {
        n = {
          ["<C-l>"] = actions.select_default,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        i = {
          ["<C-l>"] = actions.select_default,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        }
      }
    }
  }
}
