autocmd BufWritePre * %s/\s\+$//e
autocmd FileType javascript noremap <buffer>  <a-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <a-f> :call JsonBeautify()<cr>
autocmd FileType html noremap <buffer> <a-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <a-f> :call CSSBeautify()<cr>
autocmd BufWritePre *.js :call SaveFileKeepPosition("JsBeautify")
autocmd BufWritePre *.json :call SaveFileKeepPosition("JsonBeautify")
autocmd BufWritePre *.html :call SaveFileKeepPosition("HtmlBeautify")
autocmd BufWritePre *.css :call SaveFileKeepPosition("CSSBeautify")

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

