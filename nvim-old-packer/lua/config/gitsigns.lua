local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  return
end

local optsWithSigns = {
  add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAdd'   , linehl='GitSignsAdd'},
  change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChange', linehl='GitSignsChange'},
  delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDelete', linehl='GitSignsDelete'},
  topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDelete', linehl='GitSignsDelete'},
  changedelete = {hl = 'GitSignsChange', text = '^', numhl='GitSignsChange', linehl='GitSignsChange'},
}

local optsNoSigns = {
  add          = {hl = 'GitSignsAdd'   , numhl='GitSignsAdd'   , linehl='GitSignsAdd'},
  change       = {hl = 'GitSignsChange', numhl='GitSignsChange', linehl='GitSignsChange'},
  delete       = {hl = 'GitSignsDelete', numhl='GitSignsDelete', linehl='GitSignsDelete'},
  topdelete    = {hl = 'GitSignsDelete', numhl='GitSignsDelete', linehl='GitSignsDelete'},
  changedelete = {hl = 'GitSignsChange', numhl='GitSignsChange', linehl='GitSignsChange'},
}

gitsigns.setup({
  signs = optsNoSigns,
  keymaps = {},
})
