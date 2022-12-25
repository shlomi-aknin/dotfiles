local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end

mason.setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = { 'eslint', 'jsonls', 'tsserver' },
    automatic_installation = true,
})

require('mason-lspconfig').setup_handlers {
  function (server_name) -- default handler (optional)
    require('lspconfig')[server_name].setup {}
  end,
}
