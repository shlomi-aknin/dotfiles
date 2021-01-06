nnoremap <SPACE> <Nop>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
let mapleader=" "
map <C-n> :NERDTreeToggle<CR>
nmap <leader>e :CocCommand explorer --open-action-strategy tab<CR>
nnoremap <C-p> :FZF<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>f       :Files<CR>
nnoremap <leader>h	:noh<CR>
nmap <A-j> :move +1<CR>
nmap <A-k> :move -2<CR>
nnoremap <C-j> :tabnext<CR>
nnoremap <C-k> :tabprevious<CR>
nnoremap ; +
nnoremap ' -
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
nnoremap <silent> <leader>F  :Farf<cr>
autocmd FileType javascript noremap <buffer>  <a-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <a-f> :call JsonBeautify()<cr>
autocmd FileType html noremap <buffer> <a-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <a-f> :call CSSBeautify()<cr>
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/skeleton.'.expand("<afile>:e")
augroup END
autocmd BufWritePre *.js :call JsBeautify()
