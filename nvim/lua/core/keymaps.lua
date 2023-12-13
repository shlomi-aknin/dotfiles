local keymap = vim.keymap

keymap.set('n', 'gv', 'Vg_%', { silent = true }) 
keymap.set('n', 'H', '^', { silent = true }) 
keymap.set('n', 'L', 'g_', { silent = true }) 
keymap.set('n', '<C-h>', ':bp<CR>', { silent = true }) 
keymap.set('n', '<C-j>', 'yyp', { silent = true }) 
keymap.set('n', '<C-k>', 'yyP', { silent = true }) 
keymap.set('n', '<C-l>', ':bn<CR>', { silent = true }) 
keymap.set('n', '<C-t>', ':enew<CR>', { silent = true }) 
keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { silent = true }) 
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true }) 
keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { silent = true }) 
keymap.set('n', '<leader>j', 'o<ESC>', { silent = true }) 
keymap.set('n', '<leader>k', 'O<ESC>', { silent = true }) 
keymap.set('n', '<leader>qq', ':bd!<CR>', { silent = true }) 
keymap.set('n', '<leader>s', ':w<CR>', { silent = true }) 
keymap.set('n', '<leader>x', ':bufdo bwipeout<CR>', { silent = true }) 
