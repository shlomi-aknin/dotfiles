local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = '~/.local/share/nvim/site/pack/packer/opt/'
local install_fpath = install_path .. 'packer.nvim'

if fn.empty(fn.glob(install_fpath)) > 0 then
  execute('!mkdir -p ' .. install_path)
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_fpath)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost minimal_init.lua PackerCompile]]
vim.cmd [[autocmd BufWritePost minimal_init.lua PackerInstall]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-telescope/telescope.nvim'
	use 'hoob3rt/lualine.nvim'
	use 'akinsho/nvim-bufferline.lua'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
	use 'glepnir/lspsaga.nvim'
	use 'terrortylor/nvim-comment'
	use 'windwp/nvim-spectre'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'kabouzeid/nvim-lspinstall'
	use {'phaazon/hop.nvim', as = 'hop' }
	use {'dracula/vim', as = 'dracula'}
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

