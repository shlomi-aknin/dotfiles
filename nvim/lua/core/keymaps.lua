local keymap = vim.keymap
local telescope_builtin = require('telescope.builtin')
local live_grep_args_shortcuts = require('telescope-live-grep-args.shortcuts')
local downloads_directory = vim.fn.expand('$HOME/Downloads')
local toggle_quickfix = require('core.toggle-quickfix').toggle_qf

keymap.set('n', 'gv', 'Vg_%', { noremap = true, silent = true })
keymap.set('n', 'H', '^', { noremap = true, silent = true })
keymap.set('n', 'L', 'g_', { noremap = true, silent = true })
keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true })
keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-]>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-[>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-j>', 'yyp', { noremap = true, silent = true })
keymap.set('n', '<C-k>', 'yyP', { noremap = true, silent = true })
keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-t>', ':enew<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>as', ':ASToggle<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>b', function() telescope_builtin.buffers() end, { noremap = true, silent = true })
keymap.set('n', '<leader>cc', function() toggle_quickfix() end, { noremap = true, silent = true, nowait = true })
keymap.set('n', '<leader>ch', function() vim.lsp.buf.incoming_calls() end, { noremap = true, silent = true, nowait = true })
keymap.set('n', '<leader>db', ':Dbee toggle<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>dsc', function() require("dbee").store("csv", "file", { extra_arg = downloads_directory .. '/sql-export-' .. os.date("%Y%m%d%H%M%S") .. '.csv' }) end, { silent = true })
keymap.set('n', '<leader>dsj', function() require("dbee").store("json", "file", { extra_arg = downloads_directory .. '/sql-export-' .. os.date("%Y%m%d%H%M%S") .. '.json' }) end, { silent = true })
keymap.set('n', '<leader>e', ':Oil<CR>', { silent = true })
keymap.set('n', '<leader>f', function() telescope_builtin.find_files({ hidden = true, no_ignore = true }) end, { noremap = true, silent = true })
keymap.set('n', '<leader>mh', function() require("memento").toggle() end, { noremap = true, silent = true })
keymap.set('n', '<leader>mc', function() require("memento").clear_history() end, { noremap = true, silent = true })
keymap.set('n', '<leader>j', 'o<ESC>', { noremap = true, silent = true })
keymap.set('n', '<leader>k', 'O<ESC>', { noremap = true, silent = true })
keymap.set('n', '<leader>p', function() telescope_builtin.lsp_document_symbols({ symbols = { "method" }  }) end, { noremap = true, silent = true })
keymap.set('n', '<leader>qq', ':bd!<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>tn', ':tabnew %<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader><leader>', ':HopWord<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>x', ':1,$ bd!<CR>', { silent = true, nowait = true })
keymap.set('n', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
keymap.set('n', 'gjf', ':sp | terminal npx jest --no-coverage %<CR>', { silent = true })
keymap.set('n', 'gsl', live_grep_args_shortcuts.grep_word_under_cursor, { noremap = true, silent = true })
keymap.set('n', 'gsL', telescope_builtin.live_grep, { noremap = true, silent = true })
keymap.set('v', 'gsv', live_grep_args_shortcuts.grep_visual_selection, { noremap = true, silent = true })
keymap.set('n', 'gsp', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
keymap.set('n', 'gsw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
keymap.set('n', 'gsf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file" })
keymap.set('n', 's', require('substitute').operator, { noremap = true })
keymap.set('n', 'ss', require('substitute').line, { noremap = true })

keymap.set('x', 's', require('substitute').visual, { noremap = true })

-- keymap.set('n', '<F1>', function()
--   vim.cmd('below split')
--   vim.cmd('terminal')
--   vim.fn.feedkeys('a')
--   local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
--   vim.fn.feedkeys('clear' .. enter)
--   vim.fn.feedkeys('~/.local/bin/run-scratch.sh' .. enter)
-- end)

keymap.set('v', 'gsw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
keymap.set('v', '>', '>gv', { noremap = true })
keymap.set('v', '<', '<gv', { noremap = true })
keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
keymap.set('v', '<leader>/', ':CommentToggle<CR>', { silent = true })


keymap.set({ 'c', 'x' }, '<C-j>', '<C-n>', { noremap = true, silent = true })
keymap.set({ 'c', 'x' }, '<C-k>', '<C-p>', { noremap = true, silent = true })
keymap.set({ 'c', 'x' }, '<C-l>', '<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }
    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    keymap.set('n', 'gpd', ':vsplit | lua vim.lsp.buf.definition()<CR>', opts)
    -- keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap.set('n', 'sh', vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    keymap.set('n', '<space>rn', ':Lspsaga rename<CR>', opts)
    -- keymap.set('n', '<space>rf', ':TSToolsRenameFile<CR>', opts)
    -- keymap.set('n', '<space>ru', ':TSToolsRemoveUnused<CR>', opts)
    -- keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>ca", function()
    --   require("tiny-code-action").code_action()
    -- end, { noremap = true, silent = true })
    keymap.set({ 'n', 'v' }, '<space>ca', ':Lspsaga code_action<CR>', opts)
    -- keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- keymap.set('n', 'gr', ':Lspsaga finder ref<CR>', opts)
    keymap.set('n', 'gr', ':Telescope lsp_references show_line=false<CR>', opts)
  end,
})
