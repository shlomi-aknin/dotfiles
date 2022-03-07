local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute('packadd packer.nvim')
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

local use = packer.use

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

packer.startup(function()
  use {'andymass/vim-matchup'}
  use {'akinsho/toggleterm.nvim'}
  use {'cappyzawa/trim.nvim'}
  use {'dracula/vim', as = 'dracula'}
  use {'gbprod/cutlass.nvim'}
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
  use {'lukas-reineke/cmp-rg'}
  use {'mfussenegger/nvim-dap'}
  use {'mg979/vim-visual-multi'}
  use {'mhartington/formatter.nvim'}
  use {'nmac427/guess-indent.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lualine/lualine.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'onsails/lspkind-nvim'}
  use {'peterrincker/vim-searchlight'}
  use {'phaazon/hop.nvim'}
  use {'pocco81/autosave.nvim'}
  use {'ray-x/lsp_signature.nvim'}
  use {'rcarriga/nvim-dap-ui'}
  use {'rmagatti/auto-session'}
  use {'rmagatti/goto-preview'}
  use {'stefandtw/quickfix-reflector.vim'}
  use {'stevearc/qf_helper.nvim'}
  use {'terrortylor/nvim-comment'}
  use {'tzachar/cmp-tabnine', run = './install.sh'}
  use {'tzachar/cmp-fuzzy-buffer'}
  use {'tzachar/fuzzy.nvim'}
  use {'ur4ltz/surround.nvim'}
  use {'vifm/vifm.vim'}
  use {'whoissethdaniel/toggle-lsp-diagnostics.nvim'}
  use {'williamboman/nvim-lsp-installer'}
  use {'windwp/nvim-autopairs'}
  use {'windwp/nvim-spectre'}
  use {'windwp/nvim-ts-autotag'}

  if packer_bootstrap then
    packer.sync()
  end
end)
