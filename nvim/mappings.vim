inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <C-l> <C-r>=expand('%:t:r')<CR>
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap jj <Esc>
nmap <silent> gd <Plug>(coc-definition)
nmap s <Plug>(easymotion-overwin-w)
nnoremap ' -
nnoremap ; +
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-m> :Emmet<space>
nnoremap <CR> o<Esc>
nnoremap <F3> :%s/<C-r><C-w>/
nnoremap <leader>c :<c-u>up <bar> %bd <bar> e#<cr>
nnoremap <leader>D :AnyFoldActivate<cr> zR
nnoremap <leader>k <esc>V$% :TComment<cr>
nnoremap <silent> <C-c> :bw<CR>
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-s> :bd!<CR>
nnoremap <silent> <C-t> :enew<CR>
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <silent><A-r> :BTags<CR>
nnoremap <silent><leader>0 :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>= :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nnoremap <silent><leader>- :source ~/.config/nvim/init.vim \| :PlugClean<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>e :CocCommand explorer --quit-on-open --open-action-strategy sourceWindow<CR>
nnoremap <silent><leader>g :GFiles?<CR>
nnoremap <silent><leader>h :noh<CR>
nnoremap <silent><leader>p :Vista finder coc<CR>
nnoremap <silent><leader>r :e!<cr>
nnoremap <silent><leader>s :update<CR>
nnoremap <silent><leader>S :bufdo wall<CR>
nnoremap <silent><leader>t :let $VIM_DIR=expand('%:p:h')<cr>:silent !alacritty --working-directory $VIM_DIR<cr>
nnoremap <silent><leader>q :call tag_peek#ShowTag()<CR>
nnoremap <silent><leader>x :bufdo bd!<CR>
nnoremap <silent><leader>vy ggVGy<ESC><C-o>
nnoremap <silent><leader>z :Files<CR>
nnoremap <silent><nowait> <leader>d :call CocAction('jumpDefinition', v:false)<CR>
nnoremap C ^i
nnoremap ds diwx
vnoremap < <gv
vnoremap > >gv
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <F4> :s/SEARCH/REPLACE/g
