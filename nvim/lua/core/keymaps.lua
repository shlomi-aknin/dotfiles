local keymap = vim.keymap
local telescope_builtin = require('telescope.builtin')
local downloads_directory = vim.fn.expand('$HOME/Downloads')

keymap.set('n', 'gv', 'Vg_%', { silent = true })
keymap.set('n', 'H', '^', { silent = true })
keymap.set('n', 'L', 'g_', { silent = true })
keymap.set('n', '<C-h>', ':bp<CR>', { silent = true })
keymap.set('n', '<C-j>', 'yyp', { silent = true })
keymap.set('n', '<C-k>', 'yyP', { silent = true })
keymap.set('n', '<C-l>', ':bn<CR>', { silent = true })
keymap.set('n', '<C-t>', ':enew<CR>', { silent = true })
keymap.set('n', '<leader>b', function() telescope_builtin.buffers() end, { noremap = true, silent = true })
keymap.set('n', '<leader>db', ':Dbee toggle<CR>', { silent = true })
keymap.set('n', '<leader>dsc', function() require("dbee").store("csv", "file", { extra_arg = downloads_directory .. '/sql-export-' .. os.date("%Y%m%d%H%M%S") .. '.csv' }) end, { silent = true })
keymap.set('n', '<leader>dsj', function() require("dbee").store("json", "file", { extra_arg = downloads_directory .. '/sql-export-' .. os.date("%Y%m%d%H%M%S") .. '.json' }) end, { silent = true })
keymap.set('n', '<leader>e', ':Oil<CR>', { silent = true })
keymap.set('n', '<leader>f', function() telescope_builtin.find_files({ hidden = true }) end, { noremap = true, silent = true })
keymap.set('n', '<leader>j', 'o<ESC>', { silent = true })
keymap.set('n', '<leader>k', 'O<ESC>', { silent = true })
keymap.set('n', '<leader>p', function() telescope_builtin.lsp_document_symbols({ symbols = { "method" } }) end,
  { silent = true })
keymap.set('n', '<leader>qq', ':bd!<CR>', { silent = true })
keymap.set('n', '<leader>s', ':w<CR>', { silent = true })
keymap.set('n', '<leader>tc', ':tabclose<CR>', { silent = true })
keymap.set('n', '<leader>tn', ':tabnew %<CR>', { silent = true })
keymap.set('n', '<leader><leader>', ':HopWord<CR>', { silent = true })
keymap.set('n', '<leader>x', ':1,$ bd!<CR>', { silent = true, nowait = true })
keymap.set('n', '<leader>/', ':CommentToggle<CR>', { silent = true })
keymap.set('n', 'gjf', ':sp | terminal npx jest --no-coverage %<CR>', { silent = true })
keymap.set('n', 'gsp', telescope_builtin.live_grep, {})
keymap.set('n', 'gst', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
keymap.set('n', 'gsw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
keymap.set('n', 'gsf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file" })

vim.keymap.set('n', '<F1>', function()
  vim.cmd('below split')
  vim.cmd('terminal')
  vim.fn.feedkeys('a')
  local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
  vim.fn.feedkeys('clear' .. enter)
  vim.fn.feedkeys('cd ~/Workspace/cymbio-api-3 && TZ=UTC NODE_ENV=prod NODE_OPTIONS="--inspect-brk" npx ts-node --swc ./scratches/analytics-report.ts' .. enter)
end)

keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
keymap.set('v', '<leader>/', ':CommentToggle<CR>', { silent = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
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
    -- keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    keymap.set({ 'n', 'v' }, '<space>ca', ':Lspsaga code_action<CR>', opts)
    -- keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    keymap.set('n', 'gr', ':Lspsaga finder ref<CR>', opts)
  end,
})
