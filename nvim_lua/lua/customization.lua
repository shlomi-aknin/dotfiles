local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local actions = require('telescope.actions')
vim.g.nvim_tree_bindings = {
        ['l']           = tree_cb('edit'),
        ['h']        = tree_cb('close_node'),
}
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_highlight_opened_files = 1

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<C-n>'] = false,
        ['<C-p>'] = false,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<esc>'] = actions.close
      },
    },
  }
}
