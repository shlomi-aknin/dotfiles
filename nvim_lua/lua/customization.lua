local tree_cb = require('nvim-tree.config').nvim_tree_callback
local actions = require('telescope.actions')
local lspconfig = require('lspconfig')

vim.g.nvim_tree_bindings = {
        ['l']           = tree_cb('edit'),
        ['h']        = tree_cb('close_node'),
}
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_highlight_opened_files = 1

require('telescope').setup {
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

require('lualine').setup {
  options = {
    theme = 'dracula',
  },
}

lspconfig.tsserver.setup{on_attach=require'completion'.on_attach}

 -- local function t(str)
     -- return vim.api.nvim_replace_termcodes(str, true, true, true)
 -- end
 -- 
 -- function _G.smart_tab()
     -- return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
 -- end

