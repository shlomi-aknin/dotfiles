---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { ":w<cr>", "Save",opts = { nowait = true } },
    ["<leader>e"] = { ":NvimTreeToggle<cr>", "Toggle Nvim Tree",opts = { nowait = true } },
    ["<C-l>"] = { ":bn<cr>", "Toggle Nvim Tree",opts = { nowait = true } },
    ["<C-h>"] = { ":bp<cr>", "Toggle Nvim Tree",opts = { nowait = true } },
    ["<C-j>"] = { "yyp", "Copy line down",opts = { nowait = true } },
    ["<C-k>"] = { "yyP", "Copy line up",opts = { nowait = true } },
    ["<leader>bb"] = { ":Telescope buffers<cr>", "Find open buffer",opts = { nowait = true } },
    ["<leader>qq"] = { ":bd!<cr>", "Delete buffer",opts = { nowait = true } },
    ["H"] = { "^", "Goto first non blank",opts = { nowait = true } },
    ["L"] = { "g_", "Goto last non blank",opts = { nowait = true } },
    ["gv"] = { "Vf{%", "Goto last non blank",opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
