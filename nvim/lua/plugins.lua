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
  use {'anuvyklack/hydra.nvim'}
  use {'cappyzawa/trim.nvim'}
  use {'Darazaki/indent-o-matic'}
  use {'David-Kunz/jester'}
  use {'declancm/cinnamon.nvim'}
  use {'dracula/vim', as = 'dracula'}
  use {'elianiva/telescope-npm.nvim'}
  use {'folke/tokyonight.nvim'}
  use {'fgheng/winbar.nvim'}
  use {'gbprod/cutlass.nvim'}
  use {'haishanh/night-owl.vim'}
  use {'f-person/git-blame.nvim'}
  use {'famiu/nvim-reload'}
  use {'fedepujol/move.nvim'}
  use {'folke/lsp-colors.nvim'}
  use {'folke/trouble.nvim'}
  use {'folke/which-key.nvim'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-nvim-lsp-document-symbol'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/vim-vsnip'}
  use {'j-hui/fidget.nvim'}
  use {'jiangmiao/auto-pairs'}
  use {'JoosepAlviste/nvim-ts-context-commentstring'}
  use {'karb94/neoscroll.nvim'}
  use {'kdheepak/tabline.nvim'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'ldelossa/gh.nvim'}
  use {'ldelossa/litee.nvim'}
  use {'leafOfTree/vim-matchtag'}
  use {'lewis6991/gitsigns.nvim'}
  use {'lukas-reineke/cmp-rg'}
  use {'mfussenegger/nvim-dap'}
  use {'mg979/vim-visual-multi'}
  use {'mhartington/formatter.nvim'}
  use {'mrjones2014/smart-splits.nvim'}
  use {'nmac427/guess-indent.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lualine/lualine.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'nvim-telescope/telescope-file-browser.nvim'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-treesitter/nvim-treesitter-context'}
  use {'onsails/lspkind-nvim'}
  use {'peterrincker/vim-searchlight'}
  use {'phaazon/hop.nvim'}
  use {'pocco81/autosave.nvim'}
  use {'pwntester/octo.nvim'}
  use {'ray-x/lsp_signature.nvim'}
  use {'rcarriga/nvim-dap-ui'}
  use {'rhysd/conflict-marker.vim'}
  use {'rmagatti/auto-session'}
  use {'rmagatti/goto-preview'}
  use {'sindrets/diffview.nvim'}
  use {'spywhere/detect-language.nvim'}
  use {'stefandtw/quickfix-reflector.vim'}
  use {'stevearc/dressing.nvim'}
  use {'stevearc/qf_helper.nvim'}
  use {'gbprod/substitute.nvim'}
  use {'terrortylor/nvim-comment'}
  use {'tzachar/cmp-tabnine', run = './install.sh'}
  use {'tzachar/cmp-fuzzy-buffer'}
  use {'tzachar/fuzzy.nvim'}
  use {'ur4ltz/surround.nvim'}
  use {'vifm/vifm.vim'}
  use {'weilbith/nvim-code-action-menu'}
  use {'whoissethdaniel/toggle-lsp-diagnostics.nvim'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {'williamboman/nvim-lsp-installer'}
  use {'windwp/nvim-autopairs'}
  use {'windwp/nvim-spectre'}
  use {'windwp/nvim-ts-autotag'}

  if packer_bootstrap then
    packer.sync()
  end
end)
