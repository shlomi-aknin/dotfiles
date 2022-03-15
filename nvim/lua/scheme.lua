vim.cmd([[
  silent! colorscheme dracula
  hi Comment guifg=#34a1eb gui=bold
  hi CursorLine guibg=#00509d
  hi CursorLineNr guifg=#ffff00 guibg=#000000
  hi CursorWord gui=underline
  hi DraculaFg guifg=#ffffff gui=bold
  hi DraculaGreen guifg=#50fa7b gui=bold
  hi DraculaPink guifg=#ff79c6 gui=bold
  hi DraculaPurple guifg=#ffa0a0 gui=bold
  hi ErrorMsg guibg=#ffa0a0 guifg=#000000 gui=bold
  hi Folded guibg=#34a1eb guifg=#000000
  hi GitSignsAdd guifg=#50fa7b guibg=#000000 gui=bold
  hi GitSignsChange guifg=#ff79c6 guibg=#000000 gui=bold
  hi GitSignsDelete guifg=#ff5555 guibg=#000000 gui=bold
  hi HopNextKey guifg=#50fa7b
  hi HopNextKey1 guifg=#50fa7b
  hi HopNextKey2 guifg=#50fa7b
  hi IncSearch guibg=#50fa7b guifg=#000000 gui=bold
  hi IndentEven guibg=NONE
  hi IndentOdd guibg=#001f33
  hi LineNr guibg=#000000 guifg=#34a1eb gui=bold
  hi LspSignatureActiveParameter guifg=#000000 guibg=#34a1eb gui=bold
  hi MatchParen guibg=#2176FF guifg=#ffffff gui=bold
  hi NonText guifg=#34a1eb guibg=#000000 gui=bold
  hi Normal guifg=#ffffff guibg=#000000 gui=bold
  hi NormalSelected guifg=#50fa7b gui=bold
  hi NvimTreeFolderIcon guibg=#34a1eb
  hi PMenu guibg=#00509d guifg=#ffffff gui=bold
  hi PMenuSel guibg=#34a1eb guifg=#000000 blend=0
  hi Search guifg=#000000 guibg=#ff79c6 gui=bold
  hi SignColumn guibg=#000000 guifg=#34a1eb gui=bold
  hi String guifg=#fff9c6 gui=bold
  hi TelescopeBorder guifg=#34a1eb gui=bold
  hi TelescopeNormal guibg=#000000
  hi TelescopeMatching guifg=#ffffff gui=bold
  hi TelescopeSelection guibg=#34a1eb guifg=#000000 gui=bold
  hi TSVariable guifg=#ffff00 gui=bold
  hi javaScriptLineComment guifg=#34a1eb gui=italic
  hi link jsComment Comment
  hi link Searchlight IncSearch
  hi link TelescopeMultiSelection NormalSelected
  hi link javaScriptStringS String
  hi link jsString String
  hi TSParameter guifg=#8be9fd gui=bold,italic
  hi TSParameterReference guifg=#8be9fd gui=bold,italic
  hi TSField guifg=#8be9fd gui=bold,italic
]])

  -- hi CursorLineNr guifg=#ffff00 guibg=#00509d
  -- hi LineNr guibg=#34a1eb guifg=#000000 gui=bold

  -- hi TabLine guibg=#000000 guifg=#ffff00 gui=NONE
  -- hi TabLineModCur guibg=#50fa7b guifg=#000000 gui=bold
  -- hi TabLineModNorm guibg=#6272a4 guifg=#ffffff gui=bold
  -- hi TabLineSel guibg=#34a1eb guifg=#000000
