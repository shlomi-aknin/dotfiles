local keymap = vim.keymap
local telescope_builtin = require('telescope.builtin')

keymap.set('n', 'gv', 'Vg_%', { silent = true })
keymap.set('n', 'H', '^', { silent = true })
keymap.set('n', 'L', 'g_', { silent = true })
keymap.set('n', '<C-h>', ':bp<CR>', { silent = true })
keymap.set('n', '<C-j>', 'yyp', { silent = true })
keymap.set('n', '<C-k>', 'yyP', { silent = true })
keymap.set('n', '<C-l>', ':bn<CR>', { silent = true })
keymap.set('n', '<C-t>', ':enew<CR>', { silent = true })
keymap.set('n', '<leader>b', function() telescope_builtin.buffers() end, { noremap = true, silent = true })
keymap.set('n', '<leader>e', ':Oil<CR>', { silent = true })
keymap.set('n', '<leader>f', function() telescope_builtin.find_files() end, { noremap = true, silent = true })
keymap.set('n', '<leader>j', 'o<ESC>', { silent = true })
keymap.set('n', '<leader>k', 'O<ESC>', { silent = true })
keymap.set('n', '<leader>p', function() telescope_builtin.lsp_document_symbols({ symbols = { "method" } }) end,
  { silent = true })
keymap.set('n', '<leader>qq', ':bd!<CR>', { silent = true })
keymap.set('n', '<leader>s', ':FormatWrite<CR>', { silent = true })
keymap.set('n', '<leader>x', ':bufdo bd!<CR>', { silent = true })
keymap.set('n', '<leader>/', ':CommentToggle<CR>', { silent = true })
keymap.set('n', 'gjf', ':sp | terminal npx jest --no-coverage %<CR>', { silent = true })
keymap.set('n', 'gs', telescope_builtin.live_grep, {})

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
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
