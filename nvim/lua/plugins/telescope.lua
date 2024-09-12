return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules", "build", "dist", "yarn.lock", ".git"
        },
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
    })
  end
}
