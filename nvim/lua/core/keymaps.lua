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
keymap.set('n', '<leader>p', function() require("telescope.builtin").lsp_document_symbols({ symbols = { "method" } }) end, { silent = true })
keymap.set('n', '<leader>qq', ':bd!<CR>', { silent = true })
keymap.set('n', '<leader>s', ':w<CR>', { silent = true })
keymap.set('n', '<leader>x', ':bufdo bd!<CR>', { silent = true })

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
    keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
