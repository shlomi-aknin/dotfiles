local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local configs = require('lspconfig/configs')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.handlers['textDocument/references'] = require('telescope.builtin').lsp_references

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR><cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>CodeActionMenu<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

-- local servers = { 'tsserver', 'cssls', 'html', 'intelephense', 'emmet_ls', 'svelte' }
local servers = { 'cssls', 'html', 'intelephense', 'emmet_ls', 'svelte' }
for _, server in ipairs(servers) do
  local settings = {}
  if (server == 'svelte') then
    settings = {
      svelte = {
        plugin = {
          svelte = {
            compilerWarnings = {
              ['a11y-no-onchange'] = 'ignore',
              ['a11y-missing-attribute'] = 'ignore',
              ['a11y-mouse-events-have-key-events'] = 'ignore',
              ['a11y-invalid-attribute'] = 'ignore'
            }
          }
        }
      }
    }
  end

  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = settings
  })
end
