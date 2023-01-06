require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { italic = true },
    variables = { italic = true },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 1, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

vim.cmd([[
    set guifont=SauceCodePro\ Nerd\ Font:h9
    silent! colorscheme tokyonight-night
    hi BreakPoint guifg=#ffa0a0
    hi CursorLineNr guifg=#ffff00
    hi LineNr guifg=#34a1eb
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
    hi IncSearch guibg=#9ece6a guifg=#000000 gui=bold
    hi TelescopeBorder guifg=#34a1eb
    hi TelescopeNormal guibg=#000000
    hi TelescopeBorder guibg=#000000
    hi TelescopeMatching guibg=#9ece6a guifg=#000000
    hi NvimTreeRootFolder guibg=#9ece6a guifg=#000000 gui=bold
    hi NvimTreeOpenedFile guibg=#000000 guifg=#9ece6a gui=bold
    hi NvimTreeNormal guibg=#000000
    hi NvimTreeNormalNC guibg=#000000
    hi NvimTreeWinSeparator guibg=#000000 guifg=#34a1eb
    hi link TelescopeMultiSelection CursorLine
    " hi PreProc gui=bold
    " hi Special gui=bold
    " hi Statement gui=bold
    " hi Type gui=bold
    " hi link typescriptStringLiteralType typescriptString
    " hi link typescriptStringProperty typescriptString
    " hi link typescriptTemplate typescriptString
    " hi typescriptAsyncFuncKeyword guifg=#ffa0a0 gui=bold
    " hi typescriptBlock gui=bold
    " hi typescriptFuncCallArg gui=bold
    " hi typescriptObjectLiteral gui=bold
    " hi typescriptString gui=bold guifg=#ff4499
  ]])

-- vim.cmd([[
--   silent! colorscheme dracula
--   hi BreakPoint guifg=#ffa0a0 guibg=#000000
--   hi Comment guifg=#34a1eb
--   hi ConflictMarkerBegin guibg=#2f7366
--   hi ConflictMarkerOurs guibg=#2e5049
--   hi ConflictMarkerTheirs guibg=#344f69
--   hi ConflictMarkerEnd guibg=#2f628e
--   hi ConflictMarkerCommonAncestorsHunk guibg=#754a81
--   hi CursorLine guibg=#00509d
--   hi CursorLineNr guifg=#ffff00 guibg=#00509d
--   hi CursorWord gui=underline
--   hi DraculaFg guifg=#ffffff
--   hi DraculaGreen guifg=#50fa7b
--   hi DraculaPink guifg=#ff79c6
--   hi DraculaPurple guifg=#ffa0a0
--   hi ErrorMsg guibg=#ffa0a0 guifg=#000000
--   hi Folded guibg=#34a1eb guifg=#000000
--   hi GitSignsAdd guifg=#50fa7b guibg=#000000
--   hi GitSignsChange guifg=#ff79c6 guibg=#000000
--   hi GitSignsDelete guifg=#ff5555 guibg=#000000
--   hi HopNextKey guifg=#50fa7b
--   hi HopNextKey1 guifg=#50fa7b
--   hi HopNextKey2 guifg=#50fa7b
--   hi IncSearch guibg=#50fa7b guifg=#000000
--   hi IndentEven guibg=NONE
--   hi IndentOdd guibg=#001f33
--   hi LineNr guibg=#000000 guifg=#34a1eb
--   hi LspSignatureActiveParameter guifg=#000000 guibg=#34a1eb
--   hi MatchParen guibg=#2176FF guifg=#ffffff
--   hi NonText guifg=#34a1eb guibg=#000000
--   hi Normal guifg=#ffffff guibg=#000000
--   hi NormalSelected guifg=#50fa7b
--   hi NvimTreeFolderIcon guifg=#34a1eb
--   hi PMenu guibg=#000
--   hi PMenuSel guibg=#34a1eb guifg=#000000 blend=0
--   hi Search guifg=#000000 guibg=#ff79c6
--   hi SignColumn guibg=#000000 guifg=#34a1eb
--   hi StatusLine guifg=#ffffff guibg=#6272a4
--   hi String guifg=#fff9c6
--   hi TelescopeBorder guifg=#34a1eb
--   hi TelescopeNormal guibg=#000000
--   hi TelescopeMatching guifg=#ffffff
--   hi link TelescopeMultiSelection NormalSelected
--   hi TelescopeSelection guibg=#34a1eb guifg=#000000
--   hi TSVariable guifg=#ffff00
--   hi WinSeparator guibg=None guifg=#34a1eb
--   hi javaScriptLineComment guifg=#34a1eb gui=italic
--   hi link jsComment Comment
--   hi link Searchlight IncSearch
--   hi link javaScriptStringS String
--   hi link jsString String
--   hi TSParameter guifg=#8be9fd,italic
--   hi TSParameterReference guifg=#8be9fd,italic
--   hi TSField guifg=#8be9fd,italic
-- ]])

  -- hi CursorLineNr guifg=#ffff00 guibg=#00509d
  -- hi LineNr guibg=#34a1eb guifg=#000000
  -- hi TabLine guibg=#000000 guifg=#ffff00 gui=NONE
  -- hi TabLineModCur guibg=#50fa7b guifg=#000000
  -- hi TabLineModNorm guibg=#6272a4 guifg=#ffffff
  -- hi TabLineSel guibg=#34a1eb guifg=#000000
