local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup({
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = 800,
    height = 600,
  }
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function LazygitToggle()
  lazygit:toggle()
end
