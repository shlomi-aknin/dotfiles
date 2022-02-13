vim.cmd([[
  silent! colorscheme dracula
  hi link jsComment Comment
  hi link Searchlight IncSearch
  hi link TelescopeMultiSelection NormalSelected
  hi link javaScriptStringS String
  hi link jsString String
]])

local set = vim.api.nvim_set_hl

set(0, 'Comment', { fg = "#34a1eb", bold = true })
set(0, 'CursorLine', { bg = "#00509d" })
set(0, 'CursorLineNr', { fg = "#ffff00", bg = "#000000", bold = true })
set(0, 'CursorWord', { underline = true })
set(0, 'Folded', { bg = "#34a1eb", fg = "#000000" })
set(0, 'GitSignsAdd', { fg = "#50fa7b", bg = "#000000", bold = true })
set(0, 'GitSignsChange', { fg = "#ff79c6", bg = "#000000", bold = true })
set(0, 'GitSignsDelete', { fg = "#ff5555", bg = "#000000", bold = true })
set(0, 'HopNextKey', { fg = "#50fa7b" })
set(0, 'HopNextKey1', { fg = "#50fa7b" })
set(0, 'HopNextKey2', { fg = "#50fa7b" })
set(0, 'IncSearch', { fg = "#000000", bg = "#50fa7b", bold = true })
set(0, 'LineNr', { fg = "#34a1eb", bg = "#000000", bold = true })
set(0, 'LspSignatureActiveParameter', { fg = "#000000", bg = "#34a1eb", bold = true })
set(0, 'MatchParen', { bg = "#2176FF", fg = "#ffffff", bold = true })
set(0, 'Normal', { fg = "#ffffff", bg = "#000000" })
set(0, 'NormalSelected', { fg = "#50fa7b", bold = true })
set(0, 'NvimTreeFolderIcon', { bg = "#34a1eb" })
set(0, 'PMenu', { bg = "#00509d", fg = "#ffffff", bold = true })
set(0, 'PMenuSel', { bg = "#34a1eb", fg = "#000000" })
set(0, 'Search', { fg = "#000000", bg = "#ff79c6", bold = true })
set(0, 'SignColumn', { bg = "#000000", fg = "#34a1eb", bold = true })
set(0, 'String', { fg = "#ff79c6", bold = true })
set(0, 'TelescopeBorder', { fg = "#34a1eb", bold = true })
set(0, 'TelescopeNormal', { bg = "#000000" })
set(0, 'TelescopeMatching', { fg = "#ffffff", bold = true })
set(0, 'TelescopeSelection', { bg = "#34a1eb", fg = "#000000", bold = true })
set(0, 'javaScriptLineComment', { fg = "#34a1eb", italic = true })
