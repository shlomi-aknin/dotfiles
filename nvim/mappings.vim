nnoremap <A-m> :Emmet<space>
nnoremap <leader>e :CocCommand explorer --quit-on-open --open-action-strategy sourceWindow<CR>
nmap s <Plug>(easymotion-overwin-w)
nnoremap ; +
nnoremap ' -
nnoremap <CR> o<Esc>
nnoremap <leader>p :Vista!!<CR>
nnoremap <leader>z :Files<CR>
nnoremap <leader>g :GFiles?<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :noh<CR>
noremap <Leader>s :update<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <silent><leader>0 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-s> :Bw<CR>
nnoremap <silent> <C-c> :Bw!<CR>
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <silent> <C-d> :g/^\s*$/d<cr>
nnoremap <F3> :%s/<C-r><C-w>/
nnoremap <leader>k <esc>V$% :TComment<cr>
nnoremap <leader>d :AnyFoldActivate<cr> zR
autocmd FileType javascript noremap <buffer>  <a-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <a-f> :call JsonBeautify()<cr>
autocmd FileType html noremap <buffer> <a-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <a-f> :call CSSBeautify()<cr>
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/skeleton.'.expand("<afile>:e")
augroup END
autocmd BufWritePre *.js :call JsBeautify()
autocmd BufWritePre *.json :call JsonBeautify()
autocmd BufWritePre *.html :call HtmlBeautify()
autocmd BufWritePre *.css :call CSSBeautify()

