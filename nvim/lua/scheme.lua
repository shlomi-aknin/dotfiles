-- vim.cmd([[
--   silent! colorscheme tokyonight-night
--   hi HopNextKey2 guifg=#50fa7b
--   hi CursorLineNr guifg=#ffff00
--   hi LineNr guifg=#34a1eb
--   hi GitSignsAdd guifg=#50fa7b
--   hi GitSignsChange guifg=#ff79c6
--   hi GitSignsDelete guifg=#ff5555
--   hi NvimTreeFolderIcon guifg=#34a1eb
--   hi Comment guifg=#34a1eb
--   hi CursorLine guibg=#00509d
--   hi CursorColumn guibg=#00509d
--   hi ErrorMsg guibg=#ffa0a0 guifg=#000000
--   hi PMenu guibg=#46244C
--   hi PMenuSel guibg=#34a1eb guifg=#000000 blend=0
--   hi WinSeparator guibg=None guifg=#34a1eb
--   hi Folded guibg=#34a1eb guifg=#000000
--   ]])

vim.cmd([[
  silent! colorscheme dracula
  hi Comment gui=bold guifg=#34a1eb
  hi ConflictMarkerBegin gui=bold guibg=#2f7366
  hi ConflictMarkerOurs gui=bold guibg=#2e5049
  hi ConflictMarkerTheirs gui=bold guibg=#344f69
  hi ConflictMarkerEnd gui=bold guibg=#2f628e
  hi ConflictMarkerCommonAncestorsHunk gui=bold guibg=#754a81
  hi CursorLine gui=bold guibg=#00509d
  hi CursorLineNr gui=bold guifg=#ffff00 guibg=#00509d
  hi CursorWord gui=bold gui=underline
  hi DraculaFg gui=bold guifg=#ffffff
  hi DraculaGreen gui=bold guifg=#50fa7b
  hi DraculaPink gui=bold guifg=#ff79c6
  hi DraculaPurple gui=bold guifg=#ffa0a0
  hi ErrorMsg gui=bold guibg=#ffa0a0 guifg=#000000
  hi Folded gui=bold guibg=#34a1eb guifg=#000000
  hi GitSignsAdd gui=bold guifg=#50fa7b guibg=#000000
  hi GitSignsChange gui=bold guifg=#ff79c6 guibg=#000000
  hi GitSignsDelete gui=bold guifg=#ff5555 guibg=#000000
  hi HopNextKey gui=bold guifg=#50fa7b
  hi HopNextKey1 gui=bold guifg=#50fa7b
  hi HopNextKey2 gui=bold guifg=#50fa7b
  hi IncSearch gui=bold guibg=#50fa7b guifg=#000000
  hi IndentEven gui=bold guibg=NONE
  hi IndentOdd gui=bold guibg=#001f33
  hi LineNr gui=bold guibg=#000000 guifg=#34a1eb
  hi LspSignatureActiveParameter gui=bold guifg=#000000 guibg=#34a1eb
  hi MatchParen gui=bold guibg=#2176FF guifg=#ffffff
  hi NonText gui=bold guifg=#34a1eb guibg=#000000
  hi Normal gui=bold guifg=#ffffff guibg=#000000
  hi NormalSelected gui=bold guifg=#50fa7b
  hi NvimTreeFolderIcon gui=bold guifg=#34a1eb
  hi PMenu gui=bold guibg=#00509d guifg=#ffffff
  hi PMenuSel gui=bold guibg=#34a1eb guifg=#000000 blend=0
  hi Search gui=bold guifg=#000000 guibg=#ff79c6
  hi SignColumn gui=bold guibg=#000000 guifg=#34a1eb
  hi StatusLine gui=bold guifg=#ffffff guibg=#6272a4
  hi String gui=bold guifg=#fff9c6
  hi TelescopeBorder gui=bold guifg=#34a1eb
  hi TelescopeNormal gui=bold guibg=#000000
  hi TelescopeMatching gui=bold guifg=#ffffff
  hi TelescopeSelection gui=bold guibg=#34a1eb guifg=#000000
  hi TSVariable gui=bold guifg=#ffff00
  hi WinSeparator gui=bold guibg=None guifg=#34a1eb
  hi javaScriptLineComment gui=bold guifg=#34a1eb gui=italic
  hi link jsComment Comment
  hi link Searchlight IncSearch
  hi link TelescopeMultiSelection NormalSelected
  hi link javaScriptStringS String
  hi link jsString String
  hi TSParameter gui=bold guifg=#8be9fd,italic
  hi TSParameterReference gui=bold guifg=#8be9fd,italic
  hi TSField guifg=#8be9fd,italic
]])

  -- hi CursorLineNr guifg=#ffff00 guibg=#00509d
  -- hi LineNr guibg=#34a1eb guifg=#000000
  -- hi TabLine guibg=#000000 guifg=#ffff00 gui=NONE
  -- hi TabLineModCur guibg=#50fa7b guifg=#000000
  -- hi TabLineModNorm guibg=#6272a4 guifg=#ffffff
  -- hi TabLineSel guibg=#34a1eb guifg=#000000
