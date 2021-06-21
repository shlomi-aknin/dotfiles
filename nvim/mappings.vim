nnoremap <silent><A-`> :set relativenumber!<cr>
inoremap jj <esc>
inoremap hh <backspace>
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>
inoremap <C-j> <esc>:m .+1<cr>==gi
inoremap <C-k> <esc>:m .-2<cr>==gi
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
nnoremap <leader>n <esc>0f}i<cr><esc>O
nnoremap <leader>N <esc>0f}i<cr><esc>O<esc>
nmap <silent> gd <Plug>(coc-definition)
nmap s <Plug>(easymotion-overwin-w)
nmap <C-s> <Plug>(esearch)
nnoremap ' -
nnoremap ; +
nnoremap cw ciw
nnoremap dw diwx
nnoremap dW diw
nnoremap X :%d<cr>
nnoremap <A-j> :m .+1<cr>==
nnoremap <A-k> :m .-2<cr>==
nnoremap <silent><A-d> :DBUIToggle<cr>
nnoremap <silent> <A-w> :set wrap!<cr>
nnoremap <C-y> ^yg_
nnoremap <C-j> o<esc>
nnoremap J yyp
nnoremap <C-k> O<esc>
nnoremap K yyP
nnoremap <C-m> :call MaximizeToggle()<cr>
nnoremap <C-n> o<esc>O<esc>S
nnoremap <A-p> o<esc>p==
nnoremap <C-p> <esc>viwp
nnoremap <F3> :%s/<C-r><C-w>/
nnoremap <leader>c :<c-u>up <bar> %bd <bar> e#<cr>
nnoremap <silent><leader>d $VF{%jd
nnoremap <leader>D :AnyFoldActivate<cr> zR
nnoremap <leader>k <esc>V$% :TComment<cr>
nnoremap <leader>/ :TComment<cr>
nnoremap <silent><leader>w :SudaWrite<cr> :e! %<cr>
nnoremap <silent> <C-c> :bw<cr>
nnoremap <silent> <C-h> :bp<cr>
nnoremap <silent> <C-l> :bn<cr>
nnoremap <silent> <C-x> :bd!<cr>
nnoremap <silent> <C-t> :enew<cr>
nnoremap <silent> <leader>lg :LazyGit<cr>
nnoremap <silent> <A-h> i<space><esc>
nnoremap <silent> <A-l> a<space><esc>
nnoremap <silent><A-r> :BTags<cr>
nnoremap <silent><leader>0 :source ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader>1 :enew<cr>:e ~/.config/nvim/mappings.vim<cr>
nnoremap <silent><leader>2 :enew<cr>:e ~/.config/nvim/plugins.vim<cr>
nnoremap <silent><leader>3 :CocCommand rest-client.request<cr>
nnoremap <silent><leader>= :source ~/.config/nvim/init.vim \| :PlugInstall<cr>
nnoremap <silent><leader>- :source ~/.config/nvim/init.vim \| :PlugClean<cr>
nnoremap <silent><leader># :g/^\s*$/d<cr>
nnoremap <leader>$ :%s/\s\+$//e<cr> :noh<cr>
nnoremap <silent><leader>b :Buffers<cr>
" nnoremap <silent><leader>b :Telescope buffers<cr>
nnoremap <silent><leader>e :CocCommand explorer --quit-on-open --open-action-strategy sourceWindow<cr>
nnoremap <silent><leader>g :GFiles?<cr>
nnoremap <silent> D :call CocAction('doHover')<cr>
nnoremap <silent><leader>h :noh<cr>
nnoremap <silent><leader>p :Vista finder coc<cr>
nnoremap <silent><leader>r :e!<cr>
nnoremap <leader>R :Rg<space>
nnoremap <leader>O :QuickFixOpenAll<cr>
nnoremap <silent><leader>s :update<cr>
nnoremap <silent><leader>S :bufdo wall<cr>
nnoremap <silent><leader>t :let $VIM_DIR=expand('%:p:h')<cr>:silent exec "!alacritty --working-directory $VIM_DIR &"<cr>
nnoremap <silent><A-g> :let $VIM_DIR=expand('%:p:h')<cr>:silent exec "!alacritty --working-directory $VIM_DIR -e lazygit &"<cr>
nnoremap <silent><A-v> :let $VIM_DIR=expand('%:p:h')<cr>:silent exec "!alacritty --working-directory $VIM_DIR -e vifm . &"<cr>
nnoremap <silent><leader>q :call tag_peek#ShowTag()<cr>
nnoremap <silent><leader>x :bufdo bd!<cr>
nnoremap <silent><leader>f :GFiles<cr>
nnoremap <silent><leader>F :Files<cr>
" nnoremap <silent><leader>f :Telescope find_files<cr>
nnoremap <silent><nowait> <leader>d <esc>Vg_%d<esc>
nnoremap <silent> <A-z> <esc>:%s/\(\s*\w\+\).*/\1/g<cr> :noh<cr>
nnoremap <silent> <A-Z> <esc>:%s/\(\s*\w\+\).*/\1/g<cr> :noh<cr> ggVG :normal A,<cr>ggVGJ$x0yg_
nnoremap C ^i
nnoremap ds diwx
nnoremap yl ^yg_
vnoremap < <gv
vnoremap > >gv
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv
vnoremap <leader>/ :TComment<cr>
command WQ wq
command Wq wq
command W w
command Q q
