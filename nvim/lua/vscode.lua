vim.o.clipboard = 'unnamedplus'
local map = function(mode, key, value, opts)
	vim.api.nvim_set_keymap(mode, key, value, opts or { noremap = true, silent = true });
end

map('n', '<space>/', '<cmd>call VSCodeNotify("editor.action.commentLine")<cr>')
map('n', '<space>e', '<cmd>call VSCodeNotify("workbench.explorer.fileView.focus")<cr>')
map('n', '<space>f', '<cmd>call VSCodeNotify("workbench.action.quickOpen")<cr>')
map('n', '<space>b', '<cmd>call VSCodeNotify("workbench.action.showAllEditors")<cr>')
map('n', '<space>ca', '<cmd>call VSCodeNotify("editor.action.sourceAction")<cr>')
map('n', '<space>j', 'o<esc>')
map('n', '<space>k', 'O<esc>')
map('n', '<space>r', '<cmd>call VSCodeNotify("editor.action.rename")<cr>')
map('n', '<space>s', '<cmd>call VSCodeNotify("workbench.action.files.saveFiles")<cr>')
map('n', '<S-h>', '^')
map('n', '<S-l>', 'g_')
map('n', '<C-j>', '<cmd>call VSCodeNotify("editor.action.copyLinesDownAction")<cr>')
map('n', '<C-k>', '<cmd>call VSCodeNotify("editor.action.copyLinesUpAction")<cr>')
map('n', 'za', '<cmd>call VSCodeNotify("editor.toggleFold")<cr>')
map('n', 'gpd', '<cmd>call VSCodeNotify("editor.action.revealDefinitionAside")<cr>')
map('n', 'ge', '<cmd>call VSCodeNotify("find-it-faster.findFiles")<cr>')
map('n', 'gr', '<cmd>call VSCodeNotify("references-view.findReferences")<cr>')
map('n', 'gi', '<cmd>call VSCodeNotify("editor.action.goToImplementation")<cr>')
map('n', "'",  '<cmd>call VSCodeNotify("findThenJump.initiate")<cr>')
map('n', 'ss', 'Vp')
map('n', 'siw', 'viwp')
map('n', 'saw', 'vawp')
map('n', 'si(', 'vi(p')
map('n', 'sa(', 'va(p')
map('n', 'si{', 'vi{p')
map('n', 'sa{', 'va{p')
map('n', 'si[', 'vi[p')
map('n', 'sa[', 'va[p')
map('n', 'si)', 'vi)p')
map('n', 'sa)', 'va)p')
map('n', 'si}', 'vi}p')
map('n', 'sa}', 'va}p')
map('n', 'si]', 'vi]p')
map('n', 'sa]', 'va>p')
map('n', 'si>', 'vi>p')
map('n', 'sa>', 'va]p')
map('n', 'si<', 'vi<p')
map('n', 'sa<', 'va<p')
map('n', 'si"', 'vi"p')
map('n', "si'", "vi'p")
map('n', 'sa"', 'va"p')
map('n', "sa'", "va'p")
map('n', 'gs', '<cmd>call VSCodeNotify("workbench.action.findInFiles", { "query": expand("<cword>")})<cr>')

map('v', '>', '>gv')
map('v', '<', '<gv')
map('v', '<space>/', '<cmd>call VSCodeNotifyVisual("editor.action.commentLine", 1)<cr>')

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
  use {'ur4ltz/surround.nvim'}

  if packer_bootstrap then
    packer.sync()
  end
end)

local status_ok, surround = pcall(require, 'surround')
if not status_ok then
  return
end

surround.setup({ mappings_style = 'surround' })
