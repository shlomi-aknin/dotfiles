call plug#begin('~/.local/share/nvim/site/autoload')
Plug 'RRethy/vim-illuminate'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-system-copy'
Plug 'danilamihailov/beacon.nvim'
Plug 'dkprice/vim-easygrep'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'etdev/vim-hexcolor'
Plug 'eugen0329/vim-esearch'
Plug 'haishanh/night-owl.vim'
Plug 'hlissner/vim-multiedit'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
Plug 'lepture/vim-css'
Plug 'liuchengxu/space-vim-dark'
Plug 'liuchengxu/vista.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pangloss/vim-javascript'
Plug 'pechorin/any-jump.vim'
Plug 'pseewald/vim-anyfold'
Plug 'ryanoasis/vim-devicons'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()
lua require'colorizer'.setup()
