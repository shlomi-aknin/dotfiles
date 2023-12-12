vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', 'gv', 'Vg_%') 
keymap.set('n', 'H', '^') 
keymap.set('n', 'L', 'g_') 
keymap.set('n', '<C-h>', ':bp<CR>') 
keymap.set('n', '<C-j>', 'yyp') 
keymap.set('n', '<C-k>', 'yyP') 
keymap.set('n', '<C-l>', ':bn<CR>') 
keymap.set('n', '<C-t>', ':enew<CR>') 
keymap.set('n', '<leader>b', ':Telescope buffers<CR>') 
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>') 
keymap.set('n', '<leader>f', ':Telescope find_files<CR>') 
keymap.set('n', '<leader>j', 'o<ESC>') 
keymap.set('n', '<leader>k', 'O<ESC>') 
keymap.set('n', '<leader>qq', ':bd!<CR>') 
keymap.set('n', '<leader>s', ':w<CR>') 
