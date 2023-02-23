require("tokyonight").setup({
  style = "storm",
  light_style = "day",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = { bold = true },
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help", "packer" },
  day_brightness = 1,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = true,
})

-- vim.api.nvim_set_hl(0, "@property", { fg = "#ff79c6", bold = true })
-- vim.api.nvim_set_hl(0, "@include", { bold = true })
-- vim.api.nvim_set_hl(0, "@type", { bold = true })
-- vim.api.nvim_set_hl(0, "@boolean", { bold = true })
-- vim.api.nvim_set_hl(0, "@repeat", { bold = true })
-- vim.api.nvim_set_hl(0, "@conditional", { bold = true })
-- vim.api.nvim_set_hl(0, "@number", { fg= "#50fa7b", bold = true })
-- vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#ffa0a0", bold = true })
-- vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#50fa7b", bold = true })
-- vim.api.nvim_set_hl(0, "@string", { fg = "#ffff00", bold = true })

vim.cmd([[
    silent! colorscheme tokyonight-night
    hi Bold gui=bold
    hi BreakPoint guifg=#ffa0a0
    " hi CursorLine guibg=#00509d
    hi CursorLineNr guifg=#ffff00 gui=bold
    hi LineNr guifg=#34a1eb gui=bold
    hi HopNextKey guifg=#50fa7b
    hi HopNextKey1 guifg=#50fa7b
    hi HopNextKey2 guifg=#50fa7b
    hi GitSignsAdd guifg=#50fa7b
    hi GitSignsChange guifg=#ff79c6
    hi GitSignsDelete guifg=#ff5555
    hi Comment guifg=#34a1eb
    hi ErrorMsg guibg=#ffa0a0 guifg=#000000
    hi PMenuSel guibg=#34a1eb guifg=#000000 blend=0
    hi WinSeparator guibg=None guifg=#34a1eb
    hi Folded guibg=#34a1eb guifg=#000000
    hi MatchParen guibg=#34a1eb guifg=#ffffff
    hi Search guibg=#34a1eb guifg=#000000 gui=bold
    hi StatusLine guifg=#ffffff
    hi IncSearch guibg=#9ece6a guifg=#000000 gui=bold
    hi TelescopeBorder guifg=#34a1eb
    hi TelescopeNormal guibg=#000000
    hi TelescopeBorder guibg=#000000
    hi TelescopeMatching guibg=#9ece6a guifg=#000000
    hi NvimTreeNormal gui=bold
    hi NvimTreeRootFolder guibg=#9ece6a guifg=#000000 gui=bold
    hi NvimTreeOpenedFile guibg=#000000 guifg=#9ece6a gui=bold
    hi NvimTreeNormal guibg=#000000
    hi NvimTreeNormalNC guibg=#000000
    hi NvimTreeWinSeparator guibg=#000000 guifg=#34a1eb
    hi TelescopeNormal guifg=#ffffff
    hi TelescopeMultiSelection gui=bold
    hi link typescriptImport Bold
    hi link typescriptExport Bold
    hi link typescriptBoolean Bold
  ]])
