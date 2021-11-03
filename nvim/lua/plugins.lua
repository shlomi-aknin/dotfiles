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
  use {'cappyzawa/trim.nvim'}
  use {'dracula/vim', as = 'dracula'}
  use {'fedepujol/move.nvim'}
  use {'kdheepak/tabline.nvim'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'neovim/nvim-lspconfig'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lualine/lualine.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'phaazon/hop.nvim'}
  use {'pocco81/autosave.nvim'}
  use {'terrortylor/nvim-comment'}
  use {'williamboman/nvim-lsp-installer'}
  use {'windwp/nvim-spectre'}
end)

