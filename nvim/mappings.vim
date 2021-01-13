nnoremap <SPACE> <Nop>
let mapleader=' '
nnoremap <A-m> :Emmet<space>
nnoremap <leader>e :CocCommand explorer --open-action-strategy tab<CR>
nmap s <Plug>(easymotion-overwin-w)
nnoremap <CR> o<Esc>
nnoremap <leader>p :Vista!!<CR>
nnoremap <leader>z :Files<CR>
nnoremap <leader>h :noh<CR>
noremap <Leader>s :update<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <C-j> :tabnext<CR>
nnoremap <C-k> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap ; +
nnoremap ' -
nnoremap <silent><leader>0 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nnoremap <leader>1 1gt<CR>
nnoremap <leader>2 2gt<CR>
nnoremap <leader>3 3gt<CR>
nnoremap <leader>4 4gt<CR>
nnoremap <leader>5 5gt<CR>
nnoremap <leader>6 6gt<CR>
nnoremap <leader>7 7gt<CR>
nnoremap <leader>8 8gt<CR>
nnoremap <leader>9 9gt<CR>
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <silent> <C-d> :g/^\s*$/d<cr>
nnoremap <F3> :%s/<C-r><C-w>/
nnoremap <leader>k <esc>V$% :TComment<cr>
nnoremap <leader>d :AnyFoldActivate<cr>
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

