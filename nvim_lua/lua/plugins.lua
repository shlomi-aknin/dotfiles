local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
        execute 'packadd packer.nvim'
end

require('packer').startup(function(use)

        use 'pangloss/vim-javascript'
        use 'norcalli/nvim-colorizer.lua'
        use 'kyazdani42/nvim-web-devicons'
        use 'kyazdani42/nvim-tree.lua'
        use 'romgrk/barbar.nvim'
        use 'hoob3rt/lualine.nvim'
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/completion-nvim'
        use 'RRethy/vim-illuminate'
        use 'eugen0329/vim-esearch'
        use 'akinsho/nvim-toggleterm.lua'
        use { 'dracula/vim', as = 'dracula' }
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use {
                'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
                config = function() require('gitsigns').setup() end
        }
        use {
                'nvim-telescope/telescope.nvim',
                requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }
end)

require('colorizer').setup()
require'toggleterm'.setup()
