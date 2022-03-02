local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local action_layout = require('telescope.actions.layout')

require('plenary.filetype').add_file('svelte')

local open_filtered = function(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local manager = picker.manager

  for entry in manager:iter() do
    vim.cmd(string.format('%s %s', ':e!', entry.value))
    vim.cmd('set number')
    vim.cmd('set relativenumber')
    vim.cmd('set cursorline')
  end
  vim.cmd('stopinsert')
end

function multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if num_selections > 1 then
    vim.cmd('bw!')
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format('%s %s', ':e!', entry.value))
      vim.cmd('luafile ~/.config/nvim/lua/settings.lua')
      vim.cmd('luafile ~/.config/nvim/lua/scheme.lua')
      vim.cmd('luafile ~/.config/nvim/lua/vimscript.lua')
    end
    vim.cmd('stopinsert')
  else
    actions.select_default(prompt_bufnr)
  end
end

function yank_file()
  local entry = action_state.get_selected_entry()
  copy_to_clipboard(entry.path)
end

function copy_to_clipboard(content)
  vim.fn.setreg('+', content);
  vim.fn.setreg('"', content);
  return print(string.format('Copied %s to system clipboard! \n', content))
end

telescope.setup({
  defaults = {
    preview = {
      hide_on_startup = true,
    },
    prompt_prefix = '~> ',
    layout_config = {
      preview_width = 0.6
    },
    file_ignore_patterns = { 'node_modules', '.git', 'package.json', 'package-lock.json' },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-y>'] = yank_file,
        ['<s-tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<cr>'] = multi_select,
        ['<C-l>'] = multi_select,
        ['<C-h>'] = action_layout.toggle_preview,
        ['<C-o>'] = open_filtered,
        ['<C-q>'] = actions.smart_send_to_qflist,
      },
      n = {
        ['<esc>'] = actions.close,
        ['<s-tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<cr>'] = multi_select,
        ['<C-l>'] = multi_select,
        ['<C-h>'] = action_layout.toggle_preview,
        ['<C-q>'] = actions.smart_send_to_qflist,
      }
    },
  }
})
