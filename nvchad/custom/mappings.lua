---@type MappingsTable
local M = {}

-- Function to toggle Quickfix window open and close
function ToggleQuickfix()
    if vim.fn.empty(vim.fn.getqflist()) == 0 then
        -- Quickfix window is open, so close it
        vim.cmd("cclose")
    else
        -- Quickfix window is closed, so open it
        vim.cmd("copen")
    end
end

M.general = {
  n = {
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
    ["<leader>d"] = { ":Telescope diagnostics<cr>", "Diagnostics", opts = { nowait = true, silent = true } },
    ["<leader>f"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["h"] = { "<cmd> noh <CR>h", "Clear highlight on movement", opts = { nowait = true, silent = true } },
    ["j"] = { "<cmd> noh <CR>j", "Clear highlight on movement", opts = { nowait = true, silent = true } },
    ["k"] = { "<cmd> noh <CR>k", "Clear highlight on movement", opts = { nowait = true, silent = true } },
    ["l"] = { "<cmd> noh <CR>l", "Clear highlight on movement", opts = { nowait = true, silent = true } },
    ["gs"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["gS"] = { "<cmd> Telescope grep_string <CR>", "Live grep" },
    ["<leader>qw"] = { ':lua ToggleQuickfix()<CR>', "Quickfix toggle", opts = { noremap = true, nowait = true, silent = true } },
    ["<leader>qq"] = { ":bd!<cr>", "Delete buffer", opts = { nowait = true, silent = true } },
    ["<leader>x"] = { ":%bd!<cr>", "Delete all buffer", opts = { nowait = true, silent = true } },
    ["H"] = { "^", "Goto first non blank", opts = { nowait = true, silent = true } },
    ["L"] = { "g_", "Goto last non blank", opts = { nowait = true, silent = true } },
    ["gv"] = { "Vf{%", "Visual select with matching bracket", opts = { nowait = true, silent = true } },
 },
  v = {
    [">"] = { ">gv", "indent"},
    ["gS"] = { "<cmd> Telescope grep_string <CR>", "Live grep" },
 },
}

-- more keybinds!

return M
