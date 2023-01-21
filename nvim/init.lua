if vim.g.vscode then
  -- VSCode extension
  require('vscode')
else
  -- ordinary Neovim
  require('vimscript')
  require('settings')
  require('keys')
  require('plugins')
  require('config')
  require('scheme')
end
