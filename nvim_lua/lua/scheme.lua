vim.cmd([[silent! colorscheme dracula]])

vim.cmd([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=#000000 guifg=#2DE1FC
        autocmd colorscheme * :hi PMenu guibg=#2176FF guifg=#ffffff 
        autocmd colorscheme * :hi PMenuSel guibg=#ffffff guifg=#000000 
        autocmd colorscheme * :hi Comment guifg=#34a1eb
        autocmd colorscheme * :hi CursorLine guibg=#235789 ctermbg=100 gui=NONE cterm=NONE
        autocmd colorscheme * :hi CursorLineNr guifg=#ffff00 ctermfg=248 guibg=#112630 ctermbg=235 gui=NONE cterm=NONE
        autocmd colorscheme * :hi Folded guibg=#34a1eb guifg=#000000 gui=NONE cterm=NONE
        autocmd colorscheme * :hi GitGutterAdd guibg=#009900 guifg=#ffffff ctermfg=2
        autocmd colorscheme * :hi GitGutterChange guibg=#bbbb00 guifg=#ffffff ctermfg=3
        autocmd colorscheme * :hi GitGutterDelete guibg=#ff2222 guifg=#ffffff ctermfg=1
        autocmd colorscheme * :hi HighlightedyankRegion guifg=#ffffff guibg=#129AE2
        autocmd colorscheme * :hi IncSearch guifg=#000000 guibg=#ffff00 gui=NONE cterm=NONE
        autocmd colorscheme * :hi LineNr guifg=#2DE1FC ctermfg=238 guibg=#000000 ctermbg=233 gui=NONE cterm=NONE
        autocmd colorscheme * :hi MatchParen cterm=none guibg=#129AE2 guifg=#ffffff
        autocmd colorscheme * :hi Search guibg=#ffff00 guifg=#000000
        autocmd colorscheme * :hi String guifg=#34a1eb ctermfg=222 gui=NONE cterm=NONE
        autocmd colorscheme * :hi javaScriptLineComment guifg=#34a1eb gui=italic
        autocmd colorscheme * :hi javaScriptStringS guifg=#2DE1FC ctermfg=222 gui=NONE cterm=NONE
        autocmd colorscheme * :hi jsComment guifg=#34a1eb gui=italic
        autocmd colorscheme * :hi jsString guifg=#ffff00 ctermfg=222 gui=NONE cterm=NONE
        autocmd colorscheme * :hi link Searchlight Folded
    augroup END
]])

