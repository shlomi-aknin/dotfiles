local NvimTreeSelectedFiles = {}
local tree_cb = require('nvim-tree.config').nvim_tree_callback
local winopts = require('nvim-tree.view').View.winopts
winopts.relativenumber = true
winopts.number = true
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_root_folder_modifier = ':t'

require('nvim-tree').setup({
  open_on_setup       = false,
  ignore_ft_on_setup  = {'.git', 'node_modules', '.cache'},
  auto_close          = true,
  hijack_cursor       = true,
  update_focused_file = { enable = true },
  update_to_buf_dir   = {
    enable = false,
    auto_open = false,
  },
  view = {
    auto_resize = true,
    mappings = {
      list = {
        { key = 'l', cb = tree_cb('edit') },
        { key = 'h', cb = tree_cb('close_node') },
        { key = '<Tab>', mode = 'n', cb = ':lua NvimTreeToggleFileSelected("j")<cr>'},
        { key = '<S-Tab>', mode = 'n', cb = ':lua NvimTreeToggleFileSelected("k")<cr>'},
        { key = '<C-l>', mode = 'n', cb = ':lua NvimTreeOpenFiles()<cr>'},
      }
    }
  },
})

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function NvimTreeToggleFileSelected(pressed)
  local lib = require('nvim-tree.lib')
  local node = lib.get_node_at_cursor()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local linecolor = 'NormalSelected'..line
  local hl = {}
  if node then
    if NvimTreeSelectedFiles[node.name] == nil then
      vim.cmd('hi! '..linecolor..' guifg=#50fa7b gui=bold')
      vim.api.nvim_buf_add_highlight(0, 0, linecolor, line, 0, -1)
      NvimTreeSelectedFiles[node.name] = node.absolute_path
    else
      vim.cmd('hi! clear '..linecolor)
      NvimTreeSelectedFiles[node.name] = nil
    end
  end
  if pressed == 'j' then
    vim.cmd('normal j')
  elseif pressed == 'k' then
    vim.cmd('normal k')
  end
end

function NvimTreeOpenFiles()
  local lib = require('nvim-tree.lib')
  local view = require('nvim-tree.view')
  local node = lib.get_node_at_cursor()
  local count = tablelength(NvimTreeSelectedFiles)

  if count == 0 then
    if node.has_children ~= nil then
      lib.unroll_dir(node)
    else
      lib.open_file_in_tab(node.absolute_path)
    end
  else
    view.close()
    vim.cmd('enew')
    for _,file in pairs(NvimTreeSelectedFiles) do
      vim.cmd(string.format('%s %s', ':e!', file))
    end
    NvimTreeSelectedFiles = {}
  end
end