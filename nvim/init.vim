set number
set cursorline
set termguicolors
set hidden
syntax enable
call plug#begin('~/.local/share/nvim/site/autoload')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-system-copy'
Plug 'etdev/vim-hexcolor'
Plug 'chrisbra/Colorizer'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mcchrish/nnn.vim'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'pechorin/any-jump.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haishanh/night-owl.vim'
call plug#end()
colorscheme night-owl
let g:airline_powerline_fonts = 1
let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:nnn#layout = 'new tab'
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:system_copy#copy_command='xclip -sel clipboard'
lua require'colorizer'.setup()
:nmap <leader>e :CocCommand explorer<CR>
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>f       :Files<CR>
