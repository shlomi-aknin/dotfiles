lua << EOF
vim.o.clipboard = 'unnamedplus'
local map = function(mode, key, value, opts)
	vim.api.nvim_set_keymap(mode, key, value, opts or { noremap = true, silent = true });
end

map('n', '<space>e', '<cmd>call VSCodeNotify("workbench.explorer.fileView.focus")<cr>')
map('n', '<space>f', '<cmd>call VSCodeNotify("workbench.action.quickOpen")<cr>')
map('n', '<space>b', '<cmd>call VSCodeNotify("workbench.action.showAllEditors")<cr>')
map('n', '<space>j', 'o<esc>')
map('n', '<space>k', 'O<esc>')
map('n', '<space>s', '<cmd>call VSCodeNotify("workbench.action.files.saveFiles")<cr>')
map('n', '<S-h>', '^')
map('n', '<S-l>', 'g_')
map('n', '<C-j>', 'call VSCodeNotify("editor.action.copyLinesDownAction")')
map('n', '<C-k>', 'call VSCodeNotify("editor.action.copyLinesUpAction")')
map('n', 'ss', 'Vp')
map('n', 'siw', 'viwp')
map('n', 'saw', 'vawp')
map('n', 'si(', 'vi(p')
map('n', 'sa(', 'va(p')
map('n', 'si{', 'vi{p')
map('n', 'sa{', 'va{p')
map('n', 'si[', 'vi[p')
map('n', 'sa[', 'va[p')
map('n', 'si)', 'vi)p')
map('n', 'sa)', 'va)p')
map('n', 'si}', 'vi}p')
map('n', 'sa}', 'va}p')
map('n', 'si]', 'vi]p')
map('n', 'sa]', 'va]p')

EOF
