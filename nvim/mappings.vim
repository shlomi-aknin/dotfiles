inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <leader>n <esc>0f}i<CR><ESC>O
nnoremap <leader>N <esc>0f}i<CR><ESC>O<ESC>
nmap <silent> gd <Plug>(coc-definition)
nmap s <Plug>(easymotion-overwin-w)
nnoremap ' -
nnoremap ; +
nnoremap X :%d<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <silent> <A-w> :set wrap!<CR>
nnoremap <C-y> ^yg_
nnoremap <C-j> o<Esc>
nnoremap <C-k> O<Esc>
nnoremap <C-n> o<Esc>O<Esc>S
nnoremap <C-p> o<Esc>p==
nnoremap <F3> :%s/<C-r><C-w>/
nnoremap <leader>c :<c-u>up <bar> %bd <bar> e#<cr>
nnoremap <leader>D :AnyFoldActivate<cr> zR
nnoremap <leader>k <esc>V$% :TComment<cr>
nnoremap <silent><leader>w :SudaWrite<CR> :e! %<CR>
nnoremap <silent> <C-c> :bw<CR>
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-s> :bd!<CR>
nnoremap <silent> <C-t> :enew<CR>
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <silent> <A-h> i<space><esc>
nnoremap <silent> <A-l> a<space><esc>
nnoremap <silent><A-r> :BTags<CR>
nnoremap <silent><leader>0 :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>1 :enew<CR>:e ~/.config/nvim/mappings.vim<CR>
nnoremap <silent><leader>2 :enew<CR>:e ~/.config/nvim/plugins.vim<CR>
nnoremap <silent><leader>= :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nnoremap <silent><leader>- :source ~/.config/nvim/init.vim \| :PlugClean<CR>
nnoremap <silent><leader># :g/^\s*$/d<cr>
nnoremap <leader>$ :%s/\s\+$//e<CR> :noh<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>e :CocCommand explorer --quit-on-open --open-action-strategy sourceWindow<CR>
nnoremap <silent><leader>g :GFiles?<CR>
nnoremap <silent><nowait> <leader>P :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent><leader>h :noh<CR>
nnoremap <silent><leader>p :Vista finder coc<CR>
nnoremap <silent><leader>r :e!<cr>
nnoremap <leader>R :Rg<space>
nnoremap <leader>O :QuickFixOpenAll<CR>
nnoremap <silent><leader>s :update<CR>
nnoremap <silent><leader>S :bufdo wall<CR>
nnoremap <silent><leader>t :let $VIM_DIR=expand('%:p:h')<cr>:silent exec "!alacritty --working-directory $VIM_DIR &"<cr>
nnoremap <silent><A-g> :let $VIM_DIR=expand('%:p:h')<cr>:silent exec "!alacritty --working-directory $VIM_DIR -e lazygit &"<cr>
nnoremap <silent><leader>q :call tag_peek#ShowTag()<CR>
nnoremap <silent><leader>x :bufdo bd!<CR>
nnoremap <silent><leader>vy ggVGy<ESC><C-o>
nnoremap <silent><leader>z :Files<CR>
nnoremap <silent><nowait> <leader>d <esc>Vg_%d<esc>
nnoremap <silent> <A-z> <ESC>:%s/\(\s*\w\+\).*/\1/g<cr> :noh<CR>
nnoremap <silent> <A-Z> <ESC>:%s/\(\s*\w\+\).*/\1/g<cr> :noh<CR> ggVG :normal A,<CR>ggVGJ$x0yg_
nnoremap C ^i
nnoremap ds diwx
vnoremap < <gv
vnoremap > >gv
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <F4> :s/SEARCH/REPLACE/g | :noh
