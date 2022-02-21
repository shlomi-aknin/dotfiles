local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  return
end

gitsigns.setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAdd'   , linehl='GitSignsAdd'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChange', linehl='GitSignsChange'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDelete', linehl='GitSignsDelete'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDelete', linehl='GitSignsDelete'},
    changedelete = {hl = 'GitSignsChange', text = '^', numhl='GitSignsChange', linehl='GitSignsChange'},
  },
  keymaps = {},
})
