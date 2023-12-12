local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end

local status_ok, mason_nvim_dap = pcall(require, 'mason-nvim-dap')
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

mason_lspconfig.setup_handlers({
  function (server_name) -- default handler (optional)
    require('lspconfig')[server_name].setup {}
  end,
})

mason_nvim_dap.setup({
  ensure_installed = {'node2', 'chrome', 'firefox'},
  automatic_installation = true,
  automatic_setup = true,
})
