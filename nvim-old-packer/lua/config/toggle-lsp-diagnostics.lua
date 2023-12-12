local status_ok, toggle_lsp_diagnostics = pcall(require, 'toggle_lsp_diagnostics')
if not status_ok then
  return
end

toggle_lsp_diagnostics.init({ start_on = true })

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
