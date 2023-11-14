---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true, silent = true } },
    ["<C-t>"] = { ":enew<cr>", "New Buffer", opts = { nowait = true, silent = true } },
    ["<leader>j"] = { "o<esc>", "Add line below", opts = { nowait = true, silent = true } },
    ["<leader>k"] = { "O<esc>", "Add line above", opts = { nowait = true, silent = true } },
    ["<leader>s"] = { ":w<cr>", "Save", opts = { nowait = true, silent = true } },
    ["<leader>e"] = { ":NvimTreeToggle<cr>", "Toggle Nvim Tree", opts = { nowait = true, silent = true } },
    ["<C-l>"] = { ":bn<cr>", "Toggle Nvim Tree", opts = { nowait = true, silent = true } },
    ["<C-h>"] = { ":bp<cr>", "Toggle Nvim Tree", opts = { nowait = true, silent = true } },
    ["<C-j>"] = { "yyp", "Copy line down", opts = { nowait = true, silent = true } },
    ["<C-k>"] = { "yyP", "Copy line up", opts = { nowait = true, silent = true } },
    ["<leader>b"] = { ":Telescope buffers<cr>", "Find open buffer", opts = { nowait = true, silent = true } },
    ["<leader>f"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["gs"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>qq"] = { ":bd!<cr>", "Delete buffer", opts = { nowait = true, silent = true } },
    ["<leader>x"] = { ":%bd!<cr>", "Delete all buffer", opts = { nowait = true, silent = true } },
    ["H"] = { "^", "Goto first non blank", opts = { nowait = true, silent = true } },
    ["L"] = { "g_", "Goto last non blank", opts = { nowait = true, silent = true } },
    ["gv"] = { "Vf{%", "Visual select with matching bracket", opts = { nowait = true, silent = true } },
 },
  v = {
    [">"] = { ">gv", "indent"},
 },
}

-- more keybinds!

return M
