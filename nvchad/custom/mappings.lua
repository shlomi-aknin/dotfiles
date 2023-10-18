---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true, silent = true } },
    ["<leader>s"] = { ":w<cr>", "Save",opts = { nowait = true, silent = true } },
    ["<leader>e"] = { ":NvimTreeToggle<cr>", "Toggle Nvim Tree",opts = { nowait = true, silent = true } },
    ["<C-l>"] = { ":bn<cr>", "Toggle Nvim Tree",opts = { nowait = true, silent = true } },
    ["<C-h>"] = { ":bp<cr>", "Toggle Nvim Tree",opts = { nowait = true, silent = true } },
    ["<C-j>"] = { "yyp", "Copy line down",opts = { nowait = true, silent = true } },
    ["<C-k>"] = { "yyP", "Copy line up",opts = { nowait = true, silent = true } },
    ["<leader>bb"] = { ":Telescope buffers<cr>", "Find open buffer",opts = { nowait = true, silent = true } },
    ["<leader>qq"] = { ":bd!<cr>", "Delete buffer",opts = { nowait = true, silent = true } },
    ["H"] = { "^", "Goto first non blank",opts = { nowait = true, silent = true } },
    ["L"] = { "g_", "Goto last non blank",opts = { nowait = true, silent = true } },
    ["gv"] = { "Vf{%", "Goto last non blank",opts = { nowait = true, silent = true } },
 },
  v = {
    [">"] = { ">gv", "indent"},
 },
}

-- more keybinds!

return M
