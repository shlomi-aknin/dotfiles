local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute('packadd packer.nvim')
end

local packer = require('packer')
local use = packer.use

packer.startup(function()
--	use {'akinsho/nvim-toggleterm.lua'}
--	use {'andymass/vim-matchup'}
--	use {'edluffy/specs.nvim'}
--  use {'eugen0329/vim-esearch'}
--	use {'glepnir/lspsaga.nvim'}
--	use {'hoob3rt/lualine.nvim'}
--	use {'hrsh7th/nvim-compe'}
--	use {'kabouzeid/nvim-lspinstall'}
--	use {'karb94/neoscroll.nvim'}
--	use {'kyazdani42/nvim-tree.lua'}
--	use {'kyazdani42/nvim-web-devicons'}
--	use {'lewis6991/gitsigns.nvim'}
--	use {'nacro90/numb.nvim'}
--	use {'neovim/nvim-lspconfig'}
--	use {'nvim-lua/plenary.nvim'}
--	use {'nvim-lua/popup.nvim'}
--	use {'nvim-telescope/telescope.nvim'}
--	use {'pocco81/autosave.nvim'}
--	use {'pseewald/vim-anyfold'}
--	use {'rafamadriz/friendly-snippets'}
--	use {'terrortylor/nvim-comment'}
--	use {'wbthomason/packer.nvim'}
--	use {'windwp/nvim-autopairs'}
--	use {'windwp/nvim-ts-autotag'}
--  use {'arnamak/stay-centered.nvim'}
--  use {'dracula/vim', as = 'dracula'}
--  use {'fedepujol/move.nvim'}
--  use {'honza/vim-snippets'}
--  use {'hrsh7th/vim-vsnip'}
--  use {'hrsh7th/vim-vsnip-integ'}
--  use {'jose-elias-alvarez/null-ls.nvim'}
--  use {'jose-elias-alvarez/nvim-lsp-ts-utils'}
--  use {'kdheepak/tabline.nvim'}
--  use {'leafoftree/vim-matchtag'}
--  use {'mhartington/formatter.nvim'}
--  use {'norcalli/nvim-colorizer.lua'}
--  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
--  use {'onsails/lspkind-nvim'}
--  use {'peterrincker/vim-searchlight'}
--  use {'phaazon/hop.nvim', as = 'hop'}
--  use {'ray-x/lsp_signature.nvim'}
--  use {'stefandtw/quickfix-reflector.vim'}
--  use {'tpope/vim-surround'}
--  use {'tzachar/compe-tabnine'}
--  use {'yamatsum/nvim-cursorline'}
end)

