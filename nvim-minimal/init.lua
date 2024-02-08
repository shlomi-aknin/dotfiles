local hl = vim.api.nvim_set_hl
local key = vim.api.nvim_set_keymap
-- Enable cursorline
vim.opt.cursorline = true

-- Show line numbers
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Enable termguicolors
vim.opt.termguicolors = true

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Set Scrolloff
vim.opt.scrolloff = 999

-- Colors
hl(0, "CursorLine", { bg='#44475A' })
hl(0, "Search", { bg='#BD93F9', fg='#000000' })

-- Keys
key('n', '<space>s', ':w<cr>', { silent=true })
key('n', '<C-j>', 'yyp', { silent=true })
key('n', '<C-k>', 'yyP', { silent=true })
key('n', '<C-h>', ':bp<cr>', { silent=true })
key('n', '<C-l>', ':bn<cr>', { silent=true })
key('n', '<C-t>', ':enew<cr>', { silent=true })
key('n', '<space>qq', ':bd!<cr>', { silent=true })
key('n', '<space>b', ':ls<cr>', { silent=true })
key('n', '<space>j', 'o<esc>', { silent=true })
key('n', '<space>k', 'O<esc>', { silent=true })
key('n', 'H', '^', { silent=true })
key('n', 'L', 'g_', { silent=true })
key('n', 'gv', 'Vg_%', { silent=true })

