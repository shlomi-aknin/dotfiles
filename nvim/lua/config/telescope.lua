local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

function multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = table.getn(picker:get_multi_selection())
  if num_selections > 1 then
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format('%s %s', ':e!', entry.value))
    end
    vim.cmd('stopinsert')
  else
    actions.file_edit(prompt_bufnr)
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

require('telescope').setup({
  defaults = {
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
        ['<C-l>'] = multi_select,
      },
      n = {
        ['<esc>'] = actions.close,
        ['<s-tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<C-l>'] = multi_select
      }
    },
  }
})