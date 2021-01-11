call plug#begin('~/.local/share/nvim/site/autoload')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-system-copy'
Plug 'etdev/vim-hexcolor'
Plug 'chrisbra/Colorizer'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'pechorin/any-jump.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haishanh/night-owl.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'elzr/vim-json'
Plug 'jremmen/vim-ripgrep'
Plug 'dkprice/vim-easygrep'
Plug 'maksimr/vim-jsbeautify'
Plug 'brooth/far.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
Plug 'liuchengxu/vista.vim'
call plug#end()
lua require'colorizer'.setup()
