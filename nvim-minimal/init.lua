local hl = vim.api.nvim_set_hl
local key = vim.api.nvim_set_keymap
local cmd = vim.cmd
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
cmd('syntax enable')

cmd('set grepprg=rg\\ --vimgrep\\ --smart-case')
cmd('set grepformat=%f:%l:%c:%m,%f:%l:%m')

-- Set Scrolloff
vim.opt.scrolloff = 999

vim.o.smarttab = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

-- Colors
hl(0, 'Normal',         { fg='#F8F8F2', bg='#000000' })
hl(0, 'CursorLine',     { bg='#44475A' })
hl(0, 'CursorLineNr',   { fg='#BD93F9' })
hl(0, 'LineNr',         { fg='#BD93F9' })
hl(0, 'NonText',        { fg='#BD93F9' })
hl(0, 'Comment',        { fg='#6272A4' })
hl(0, 'Cursor',         { fg='#282A36', bg='#F8F8F2' })
hl(0, 'VertSplit',      { fg='#44475A', bg='#44475A' })
hl(0, 'Visual',         { fg='#F8F8F2', bg='#6272A4' })
hl(0, 'Pmenu',          { fg='#F8F8F2', bg='#44475A' })
hl(0, 'PmenuSel',       { fg='#000000', bg='#BD93F9' })
hl(0, "StatusLine",     { bg='#6272A4', fg='#FFFFFF' })
hl(0, 'StatusLineNC',   { fg='#6272A4', bg='#44475A' })
hl(0, 'Error',          { fg='#FF5555', bg=NONE })

hl(0, 'Statement',      { fg='#FF79C6' })
hl(0, 'Keyword',        { fg='#FF79C6' })
hl(0, 'Type',           { fg='#8BE9FD' })
hl(0, 'Function',       { fg='#50FA7B' })
hl(0, 'String',         { fg='#F1FA8C' })
hl(0, 'Number',         { fg='#FF5555' })
hl(0, 'Boolean',        { fg='#FF79C6' })
hl(0, 'Operator',       { fg='#FF79C6' })
hl(0, 'Identifier',     { fg='#BD93F9' })
hl(0, 'Constant',       { fg='#FF79C6' })
hl(0, 'PreProc',        { fg='#FF79C6' })
hl(0, 'Special',        { fg='#BD93F9' })
hl(0, 'Error',          { fg='#FF5555' })
hl(0, 'Todo',           { fg='#FF79C6', bg='#44475A' })

hl(0, 'Search',         { fg='#282A36', bg='#FF79C6' })

hl(0, 'DiffAdd',        { fg='#50FA7B', bg='#44475A' })
hl(0, 'DiffDelete',     { fg='#FF5555', bg='#44475A' })
hl(0, 'DiffChange',     { fg='#FFB86C', bg='#44475A' })
hl(0, 'DiffText',       { fg='#F8F8F2', bg='#6272A4' })

hl(0, 'GitGutterAdd',          { fg='#50FA7B', bg=NONE })
hl(0, 'GitGutterChange',       { fg='#FFB86C', bg=NONE })
hl(0, 'GitGutterDelete',       { fg='#FF5555', bg=NONE })
hl(0, 'GitGutterChangeDelete', { fg='#FFB86C', bg=NONE })

-- Define key mappings to call clear_search_highlight function along with original hjkl movement
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

-- Define a function to get the current line number and total lines in the buffer
function get_line_info()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local percent = math.floor((current_line / total_lines) * 100)
    return string.format("%d/%d (%d%%)", current_line, total_lines, percent)
end

-- Set the statusline
vim.opt.statusline = [[%<%f%m%r %= %{luaeval("get_line_info()")}]]
