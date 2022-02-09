local map = function(mode, key, value, opts)
	vim.api.nvim_set_keymap(mode, key, value, opts or { noremap = true, silent = true });
end

map('c',    '<C-j>',            '<down>')
map('c',    '<C-k>',            '<up>')
map('c',    '<A-l>',            '<cr>')

map('i',    '<A-h>',            '<esc>i')
map('i',    '<A-j>',            '<esc>:MoveLine(1)<cr>gi')
map('i',    '<A-k>',            '<esc>:MoveLine(-1)<cr>gi')
map('i',    '<A-l>',            '<esc>la')
map('i',    '<C-c>',            '<esc>')

map('n',    "'",                ':HopWord<cr>')
map('n',    ',',                '<cmd>set fdm=manual<cr>0f{zf%')
map('n',    '<A-`>',            ':set relativenumber!<cr>')
map('n',    '<A-b>',            ':BufferLinePick<cr>')
map('n',    '<A-h>',            'i<space><esc>')
map('n',    '<A-i>',            ':BufferLineMoveNext<cr>')
map('n',    '<A-j>',            '<esc>:MoveLine(1)<cr>')
map('n',    '<A-k>',            '<esc>:MoveLine(-1)<cr>')
map('n',    '<A-l>',            'a<space><esc>')
map('n',    '<A-u>',            ':BufferLineMovePrev<cr>')
map('n',    '<A-t>',            ':ToggleTerm<cr>')
map('n',    '<C-A-s>',          ':Telescope live_grep<cr>')
map('n',    '<C-c>',            ':bd<cr>')
map('n',    '<C-h>',            ':bp<cr>')
map('n',    '<C-j>',            'yyp')
map('n',    '<C-k>',            'yyP')
map('n',    '<C-l>',            ':bn<cr>')
map('n',    '<C-n>',            '0f{a<cr><cr><esc>V2k=jS')
map('n',    '<C-p>',            'viwp')
map('n',    '<C-s>',            ':lua require("spectre").open()<cr>')
map('n',    '<C-t>',            ':enew<cr>')
map('n',    '<C-x>',            ':bd!<cr>')
map('n',    '<F10>',            ':lua require("dap").run_last()<cr>')
map('n',    '<F2>',             ':lua require("dapui").toggle()<cr><C-w>j')
map('n',    '<F3>',             ':lua require("dap").toggle_breakpoint()<cr>')
map('n',    '<F4>',             ':lua require("dap").step_back()<cr>')
map('n',    '<F5>',             ':lua require("dap").continue()<cr>')
map('n',    '<F6>',             ':lua require("dap").step_into()<cr>')
map('n',    '<F7>',             ':lua require("dap").step_out()<cr>')
map('n',    '<F8>',             ':lua require("dap").step_over()<cr>')
map('n',    '<F9>',             ':lua require("dap").list_breakpoints()<cr>')
map('n',    '<leader>/',        ':CommentToggle<cr>')
map('n',    '<leader>0',        ':Reload<cr>')
map('n',    '<leader>1',        ':e ~/.config/nvim/lua/plugins.lua<cr>')
map('n',    '<leader>2',        ':e ~/.config/nvim/lua/keys.lua<cr>')
map('n',    '<leader>3',        ':e ~/.config/nvim/lua/scheme.lua<cr>')
map('n',    '<leader>4',        ':e ~/.config/nvim/lua/settings.lua<cr>')
map('n',    '<leader>;',        '0vf{%:CommentToggle<cr>')
map('n',    '<leader>=',        ':PackerSync<cr>')
map('n',    '<leader>b',        ':Telescope buffers<cr>')
map('n',    '<leader>h',        ':noh<cr>')
map('n',    '<leader>db',       ':lua require("dap").list_breakpoints()<cr>')
map('n',    '<leader>dc',       ':lua require("dap").run_to_cursor()<cr>')
map('n',    '<leader>dh',       ':tabclose<cr>')
map('n',    '<leader>dl',       ':tabedit %<cr>')
map('n',    '<leader>drl',      ':lua require("dap").repl.run_last()<cr>')
map('n',    '<leader>dro',      ':lua require("dap").repl.open()<cr>')
map('n',    '<leader>dsb',      ':lua require("dap").step_back()<cr>')
map('n',    '<leader>dsc',      ':lua require("dap.ui.variables").scopes()<cr>')
map('n',    '<leader>dv',       ':lua require("dap.ui.variables").hover()<cr>')
map('n',    '<leader>dwc',      ':lua local widgets=require("dap.ui.widgets");widgets.centered_float(widgets.scopes)<cr>')
map('n',    '<leader>dwh',      ':lua require("dap.ui.widgets").hover()<cr>')
map('n',    '<leader>e',        ':NvimTreeToggle<cr>')
map('n',    '<leader>f',        ':Telescope find_files<cr>')
map('n',    '<leader>g',        ':lua LazygitToggle()<cr>')
map('n',    '<leader>j',        'o<esc>')
map('n',    '<leader>k',        'O<esc>')
map('n',    '<leader>l',        ':LLToggle<cr>')
map('n',    '<leader>m',        ':Telescope lsp_document_symbols default_text=:method:<cr>')
map('n',    '<leader>o',        ':QuickFixOpenAll<cr>')
map('n',    '<leader>p',        ':Telescope lsp_document_symbols<cr>')
map('n',    '<leader>q',        ':QFToggle<cr>')
map('n',    '<leader>rw',       ':lua require("spectre").open_visual({select_word=true})<CR>')
map('n',    '<leader>s',        ':up<cr>')
map('n',    '<leader>s',        ':wa<cr>')
map('n',    '<leader>t',        ':silent TroubleToggle<cr>')
map('n',    '<leader>v',        ':let $VIM_DIR=expand(\'%:p:h\')<cr>:silent exec "!alacritty --working-directory $VIM_DIR -e vifm . &"<cr>')
map('n',    '<leader>x',        ':bufdo bd!<cr>')
map('n',    '<leader>z',        ':EditVifm<cr>')
map('n',    'D',                ':%d<cr>')
map('n',    'H',                '^')
map('n',    'L',                'g_')
map('n',    'S',                '"_S')
map('n',    'X',                'Vx')
map('n',    'Y',                '^yg_')
map('n',    'c)',               '0f(lci(')
map('n',    'c]',               '0f[lci[')
map('n',    'cw',               'ciw')
map('n',    'c}',               '0f{lci{')
map('n',    'd',                '"_d')
map('n',    'd)',               '0f(ldi(h')
map('n',    'd]',               '0f[ldi[h')
map('n',    'dw',               'diwx')
map('n',    'd}',               '0f{ldi{h')
map('n',    'gT',               'vato<esc>')
map('n',    'gt',               'vat<esc>')
map('n',    'y)',               '0f(lyi(')
map('n',    'y]',               '0f[lyi[')
map('n',    'y}',               '0f{lyi{')

map('s',    '<C-j>',            'v:lua.tab_complete()', {expr = true})
map('s',    '<C-k>',            'v:lua.s_tab_complete()', {expr = true})

map('v',    '<',                '<gv')
map('v',    '<A-j>',            ':MoveBlock(1)<cr>')
map('v',    '<A-k>',            ':MoveBlock(-1)<cr>')
map('v',    '<leader>/',        ':CommentToggle<cr>')
map('v',    '>',                '>gv')
map('v',    'S',                '"_S')
map('v',    'c',                '"_c')
map('v',    'd',                '"_d')
map('v',    '<leader>dhv',      ':lua require("dap.ui.variables").visual_hover()<cr>')
