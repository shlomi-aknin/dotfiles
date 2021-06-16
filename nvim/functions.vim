autocmd BufWritePre * %s/\s\+$//e
autocmd FileType javascript noremap <buffer>  <a-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <a-f> :call JsonBeautify()<cr>
autocmd FileType html noremap <buffer> <a-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <a-f> :call CSSBeautify()<cr>
autocmd BufWritePre *.svelte :call SaveFileKeepPosition("")
autocmd BufWritePre *.js :call SaveFileKeepPosition("JsBeautify")
autocmd BufWritePre *.json :call SaveFileKeepPosition("JsonBeautify")
autocmd BufWritePre *.html :call SaveFileKeepPosition("HtmlBeautify")
autocmd BufWritePre *.css :call SaveFileKeepPosition("CSSBeautify")
au! BufNewFile,BufRead *.svelte set ft=html
autocmd FileType coc-explorer IndentLinesDisable
autocmd FileType coc-explorer set number
autocmd FileType coc-explorer set relativenumber

function! SaveFileKeepPosition(...)
    let l = line(".")
    let c = col(".")
    if a:0 == "JsBeautify"
        call JsBeautify()
    elseif a:0 == "JsonBeautify"
        call JsonBeautify()
    elseif a:0 == "HtmlBeautify"
        call HtmlBeautify()
    elseif a:0 == "CSSBeautify"
        call CSSBeautify()
    endif
    call cursor(l, c)
endfunction

function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction

function! QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
    :silent call DeleteEmptyBuffers()
endfunction

command! QuickFixOpenAll call QuickFixOpenAll()

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

lua require('numb').setup()

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-n>'] = false,
        ['<C-p>'] = false,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<esc>'] = actions.close
      },
    },
  }
}
EOF
