nnoremap <A-m> :Emmet<space>
nnoremap <silent><leader>e :CocCommand explorer --quit-on-open --open-action-strategy sourceWindow<CR>
nmap s <Plug>(easymotion-overwin-w)
nnoremap ; +
nnoremap ' -
nnoremap <CR> o<Esc>
nnoremap <silent><leader>p :Vista!!<CR>
nnoremap <silent><leader>z :Files<CR>
nnoremap <silent><leader>g :GFiles?<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>h :noh<CR>
nnoremap <silent><leader>s :update<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap // y:%s/<C-R>=escape(@",'/\')<CR>//g<left><left>
vnoremap > >gv
vnoremap < <gv
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
nnoremap <silent> <C-s> :bd<CR>
nnoremap <silent> <C-c> :bw<CR>
nnoremap <silent> <C-t> :enew<CR>
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <leader>c :<c-u>up <bar> %bd <bar> e#<cr>
nnoremap <silent><leader>r :e!<cr>
nnoremap <silent><leader>t :let $VIM_DIR=expand('%:p:h')<cr>:silent !alacritty --working-directory $VIM_DIR<cr>
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


" Insert a disposable marker after the cursor
nmap <leader>ma :MultieditAddMark a<CR>

" Insert a disposable marker before the cursor
nmap <leader>mi :MultieditAddMark i<CR>

" Make a new line and insert a marker
nmap <leader>mo o<Esc>:MultieditAddMark i<CR>
nmap <leader>mO O<Esc>:MultieditAddMark i<CR>

" Insert a marker at the end/start of a line
nmap <leader>mA $:MultieditAddMark a<CR>
nmap <leader>mI ^:MultieditAddMark i<CR>

" Make the current selection/word an edit region
vmap <leader>m :MultieditAddRegion<CR>
nmap <leader>mm viw:MultieditAddRegion<CR>

" Restore the regions from a previous edit session
nmap <leader>mu :MultieditRestore<CR>

" Move cursor between regions n times
map ]m :MultieditHop 1<CR>
map [m :MultieditHop -1<CR>

" Start editing!
nmap <leader>M :Multiedit<CR>

" Clear the word and start editing
nmap <leader>C :Multiedit!<CR>

" Unset the region under the cursor
nmap <silent> <leader>md :MultieditClear<CR>

" Unset all regions
nmap <silent> <leader>mr :MultieditReset<CR>
