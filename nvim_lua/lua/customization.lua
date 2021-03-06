local tree_cb = require('nvim-tree.config').nvim_tree_callback
local actions = require('telescope.actions')
local lspconfig = require('lspconfig')
local Terminal  = require('toggleterm.terminal').Terminal
local vifm = Terminal:new({ cmd = 'vifm', hidden = true, direction = 'float' })

vim.g.nvim_tree_bindings = {
        ['l']           = tree_cb('edit'),
        ['h']        = tree_cb('close_node'),
}
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.vim_search_pulse_duration = 1000
vim.g.beacon_timeout = 1000
vim.g.beacon_minimal_jump = 1

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

lspconfig.tsserver.setup {
        on_attach = function(client)
                require'completion'.on_attach(client)
                require 'illuminate'.on_attach(client)
        end,
}

function _vifm_toggle()
  vifm:toggle()
end

