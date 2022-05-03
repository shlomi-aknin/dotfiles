local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local NvimTreeSelectedFiles = {}
local tree_cb = require('nvim-tree.config').nvim_tree_callback
local winopts = require('nvim-tree.view').View.winopts
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ':t'

nvim_tree.setup({
  open_on_setup       = false,
  ignore_ft_on_setup  = {'.git', 'node_modules', '.cache'},
  hijack_cursor       = false,
  hijack_unnamed_buffer_when_opening = false,
  update_focused_file = { enable = true },
  update_cwd = false,
  view = {
    width = 35,
    height = 35,
    mappings = {
      list = {
        { key = 'l', cb = tree_cb('edit') },
        { key = 'h', cb = tree_cb('close_node') },
        { key = '<Tab>', mode = 'n', cb = ':lua NvimTreeToggleFileSelected("j")<cr>'},
        { key = '<S-h>', mode = 'n', cb = ':lua require("nvim-tree.lib").collapse_all()<cr>gg' },
        { key = '<S-Tab>', mode = 'n', cb = ':lua NvimTreeToggleFileSelected("k")<cr>'},
        { key = '<C-l>', mode = 'n', cb = ':lua NvimTreeOpenFiles()<cr>'},
      }
    },
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
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
  vim.cmd('bw!')

  if count == 0 then
    if node.has_children ~= nil then
      lib.unroll_dir(node)
    else
      vim.cmd('edit ' .. vim.fn.fnameescape(node.absolute_path))
    end
  else
    view.close()
    for _,file in pairs(NvimTreeSelectedFiles) do
      vim.cmd(string.format('%s %s', ':e!', file))
    end
    NvimTreeSelectedFiles = {}
  end
end
