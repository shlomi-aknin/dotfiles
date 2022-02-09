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
  use {'akinsho/toggleterm.nvim'}
  use {'blackCauldron7/surround.nvim'}
  use {'cappyzawa/trim.nvim'}
  use {'dracula/vim', as = 'dracula'}
  use {'famiu/nvim-reload'}
  use {'fedepujol/move.nvim'}
  use {'folke/lsp-colors.nvim'}
  use {'folke/trouble.nvim'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-nvim-lsp-document-symbol'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/vim-vsnip'}
  use {'jiangmiao/auto-pairs'}
  use {'JoosepAlviste/nvim-ts-context-commentstring'}
  use {'karb94/neoscroll.nvim'}
  use {'kdheepak/tabline.nvim'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'leafOfTree/vim-matchtag'}
  use {'lewis6991/gitsigns.nvim'}
  use {'lewis6991/impatient.nvim'}
  use {'lukas-reineke/cmp-rg'}
  use {'mfussenegger/nvim-dap'}
  use {'mhartington/formatter.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lualine/lualine.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'onsails/lspkind-nvim'}
  use {'PeterRincker/vim-searchlight'}
  use {'phaazon/hop.nvim'}
  use {'ray-x/lsp_signature.nvim'}
  use {'rcarriga/nvim-dap-ui'}
  use {'stefandtw/quickfix-reflector.vim'}
  use {'stevearc/qf_helper.nvim'}
  use {'terrortylor/nvim-comment'}
  use {'tzachar/cmp-tabnine', run = './install.sh'}
  use {'tzachar/cmp-fuzzy-buffer'}
  use {'tzachar/fuzzy.nvim'}
  use {'vifm/vifm.vim'}
  use {'whoissethdaniel/toggle-lsp-diagnostics.nvim'}
  use {'williamboman/nvim-lsp-installer'}
  use {'windwp/nvim-autopairs'}
  use {'windwp/nvim-spectre'}
  use {'windwp/nvim-ts-autotag'}
end)

-- require('impatient')
