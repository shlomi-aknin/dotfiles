return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    local active_bg = "#44475a"
    local active_fg = "#f8f8f2"
    local inactive_bg = "#282a36"
    local inactive_fg = "#FFB86C"  -- dim purple-ish comment color

    map('n', '<C-h>', ':BufferPrevious<CR>', opts)
    map('n', '<C-l>', ':BufferNext<CR>', opts)
    map('n', '<C-[>', ':BufferMovePrevious<CR>', opts)
    map('n', '<C-]>', ':BufferMoveNext<CR>', opts)

    vim.api.nvim_set_hl(0, "BufferCurrent",       { bg = active_bg, fg = active_fg })
    vim.api.nvim_set_hl(0, "BufferCurrentIndex",  { bg = active_bg, fg = "#f1fa8c" })  -- yellow
    vim.api.nvim_set_hl(0, "BufferCurrentMod",    { bg = active_bg, fg = "#ffb86c" }) -- orange
    vim.api.nvim_set_hl(0, "BufferCurrentSign",   { bg = active_bg, fg = "#bd93f9" }) -- purple
    vim.api.nvim_set_hl(0, "BufferCurrentIcon",   { bg = active_bg, fg = "#8be9fd" }) -- cyan
    vim.api.nvim_set_hl(0, "BufferCurrentTarget", { bg = active_bg, fg = "#ff5555" }) -- red (close target)
    -- vim.api.nvim_set_hl(0, "BufferCurrentSeparator",       { bg = active_bg, fg = active_bg })
    -- vim.api.nvim_set_hl(0, "BufferCurrentSeparatorVisible", { bg = active_bg, fg = active_bg })
    vim.api.nvim_set_hl(0, "BufferInactive",       { bg = inactive_bg, fg = inactive_fg })
    vim.api.nvim_set_hl(0, "BufferInactiveIndex",  { bg = inactive_bg, fg = inactive_fg })
    vim.api.nvim_set_hl(0, "BufferInactiveMod",    { bg = inactive_bg, fg = "#ffb86c" }) -- orange mod dot (optional)
    vim.api.nvim_set_hl(0, "BufferInactiveSign",   { bg = inactive_bg, fg = inactive_fg })
    vim.api.nvim_set_hl(0, "BufferInactiveIcon",   { bg = inactive_bg, fg = inactive_fg })
    -- vim.api.nvim_set_hl(0, "BufferInactiveSeparator",       { bg = inactive_bg, fg = inactive_bg })
    -- vim.api.nvim_set_hl(0, "BufferInactiveSeparatorVisible", { bg = inactive_bg, fg = inactive_bg })
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
