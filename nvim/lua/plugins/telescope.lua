return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
  },
  config = function ()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules", "build", "dist", "yarn.lock", ".git"
        },
        -- preview = {
        --   hide_on_startup = true
        -- },
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
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      }
    })
    require("telescope").load_extension("ui-select")
  end
}
