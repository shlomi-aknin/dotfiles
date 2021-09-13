local map = function(mode, key, value, opts)
	vim.api.nvim_set_keymap(mode, key, value, opts or { noremap = true, silent = true });
end

map('i', '<A-h>', '<esc>i')
map('i', '<A-j>', '<esc>:m .+1<cr>==gi')
map('i', '<A-k>', '<esc>:m .-2<cr>==gi')
map('i', '<A-l>', '<esc>la')
map('i', '<C-j>', 'v:lua.tab_complete()', { expr = true })
map('i', '<C-k>', 'v:lua.s_tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<cr>', 'compe#confirm({ "keys": "<cr>", "select": v:true })', { expr = true })

map('n', '<A-`>', ':set relativenumber!<cr>')
map('n', '<A-b>', ':BufferLinePick<cr>')
map('n', '<A-h>', 'i<space><esc>')
map('n', '<A-i>', ':BufferLineMoveNext<cr>')
map('n', '<A-j>', ':m .+1<cr>==')
map('n', '<A-k>', ':m .-2<cr>==')
map('n', '<A-l>', 'a<space><esc>')
map('n', '<A-u>', ':BufferLineMovePrev<cr>')
map('n', '<C-c>', ':bd<cr>')
map('n', '<C-h>', ':bp<cr>')
map('n', '<C-j>', 'yyp')
map('n', '<C-k>', 'yyP')
map('n', '<C-l>', ':bn<cr>')
map('n', '<C-n>', '0f{a<cr><cr><esc>V2k=jS')
map('n', '<C-p>', 'viwp')
map('n', '<C-s>', ':lua require("spectre").open({ is_insert_mode = true })<cr>')
map('n', '<C-t>', ':enew<cr>')
map('n', '<C-x>', ':bd!<cr>')
map('n', '<leader>/', ':CommentToggle<cr>')
map('n', '<leader>0', ':luafile %<cr>')
map('n', '<leader>1', ':e ~/.config/nvim/lua/plugins.lua<cr>')
map('n', '<leader>2', ':e ~/.config/nvim/lua/functions.lua<cr>')
map('n', '<leader>3', ':e ~/.config/nvim/lua/keys.lua<cr>')
map('n', '<leader>4', ':e ~/.config/nvim/lua/scheme.lua<cr>')
map('n', '<leader>5', ':e ~/.config/nvim/lua/settings.lua<cr>')
map('n', '<leader>6', ':e ~/.config/nvim/lua/variables.lua<cr>')
map('n', '<leader>=', ':PackerSync<cr>')
map('n', '<leader>S', ':wa<cr>')
map('n', '<leader>b', ':Telescope buffers<cr>')
map('n', '<leader>c', ':call ToggleQuickFix()<cr>')
map('n', '<leader>e', ':NvimTreeToggle<cr>')
map('n', '<leader>f', ':Telescope find_files<cr>')
map('n', '<leader>g', ':lua _lazygit_toggle()<cr>')
map('n', '<leader>h', ':noh<cr>')
map('n', '<leader>j', ':Lspsaga lsp_finder<cr>')
map('n', '<leader>k', '0vf{%:CommentToggle<cr>')
map('n', '<leader>l', ':e<cr>')
map('n', '<leader>m', ':Telescope lsp_document_symbols default_text=:method:<cr>')
map('n', '<leader>p', ':Telescope lsp_document_symbols<cr>')
map('n', '<leader>q', ":lua require('goto-preview').goto_preview_definition()<cr>")
map('n', '<leader>r', ':Lspsaga rename<cr>')
map('n', '<leader>s', ':up<cr>')
map('n', '<leader>t', ':let $VIM_DIR=expand(\'%:p:h\')<cr>:silent exec "!alacritty --working-directory $VIM_DIR &"<cr>')
map('n', '<leader>v', ':let $VIM_DIR=expand(\'%:p:h\')<cr>:silent exec "!alacritty --working-directory $VIM_DIR -e vifm . &"<cr>')
map('n', '<leader>x', ':bufdo bd!<cr>')
map('n', '<leader>y', '^yg_')
map('n', 'C', '^i')
map('n', 'D', ':%d<cr>')
map('n', 'K', ':Lspsaga preview_definition<cr>')
map('n', 'M', 'O<esc>')
map('n', 'Q', ":lua require('goto-preview').close_all_win()<cr>")
map('n', 'cw', 'ciw')
map('n', 'dw', 'diwx')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>')
map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>')
map('n', 'm', 'o<esc>')
map('n', 's', ':HopWord<cr>')

map('s', '<C-j>', 'v:lua.tab_complete()', {expr = true})
map('s', '<C-k>', 'v:lua.s_tab_complete()', {expr = true})

map('v', '<', '<gv')
map('v', '<A-j>', ":m '>+1<cr>gv=gv")
map('v', '<A-k>', ":m '<-2<cr>gv=gv")
map('v', '<leader>/', ':CommentToggle<cr>')
map('v', '>', '>gv')
