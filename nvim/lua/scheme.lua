vim.cmd([[
  silent! colorscheme dracula
  hi Comment guifg=#34a1eb gui=bold
  hi CursorLine guibg=#235789
  hi CursorLineNr guifg=#ffff00 guibg=#235789
  hi CursorWord gui=underline
  hi Folded guibg=#34a1eb guifg=#000000
  hi GitSignsAdd guifg=#50fa7b guibg=#000000 gui=bold
  hi GitSignsChange guifg=#ff79c6 guibg=#000000 gui=bold
  hi GitSignsDelete guifg=#ff5555 guibg=#000000 gui=bold
  hi HopNextKey guifg=#50fa7b
  hi HopNextKey1 guifg=#50fa7b
  hi HopNextKey2 guifg=#50fa7b
  hi IncSearch guibg=#000000 guifg=#50fa7b
  hi IndentEven guibg=NONE
  hi IndentOdd guibg=#001f33
  hi LineNr guifg=#000000 guibg=#34a1eb gui=bold
  hi LspSignatureActiveParameter guifg=#000000 guibg=#34a1eb gui=bold
  hi MatchParen guibg=#2176FF guifg=#ffffff gui=bold
  hi Normal guifg=#ffffff guibg=#000000 gui=bold
  hi NormalSelected guifg=#50fa7b gui=bold
  hi NvimTreeFolderIcon guibg=blue
  hi PMenu guibg=#1F1D36 guifg=#ffffff gui=bold
  hi PMenuSel guibg=#34a1eb guifg=#000000 blend=0
  hi Search guifg=#000000 guibg=#ff5555
  hi SignColumn guibg=#000000 guifg=#34a1eb gui=bold
  hi String guifg=#ff79c6 gui=bold
  hi TelescopeBorder guifg=#34a1eb gui=bold
  hi TelescopeNormal guibg=#000000
  hi TelescopeMatching guifg=#ffffff gui=bold
  hi TelescopeSelection guibg=#34a1eb guifg=#000000 gui=bold
  hi javaScriptLineComment guifg=#34a1eb gui=italic
  hi link jsComment Comment
  hi link Searchlight IncSearch
  hi link TelescopeMultiSelection NormalSelected
  hi link javaScriptStringS String
  hi link jsString String
]])

  -- hi TabLine guibg=#000000 guifg=#ffff00 gui=NONE
  -- hi TabLineModCur guibg=#50fa7b guifg=#000000 gui=bold
  -- hi TabLineModNorm guibg=#6272a4 guifg=#ffffff gui=bold
  -- hi TabLineSel guibg=#34a1eb guifg=#000000
