local tree_cb = require('nvim-tree.config').nvim_tree_callback

vim.g.UltiSnipsExpandTrigger = '<Nop>'
vim.g.aerial = {
  default_direction = 'left',
  placement_editor_edge = true,
}
vim.g.indent_blankline_char = ' '
vim.g.indent_blankline_char_highlight_list = {'IndentOdd', 'IndentEven'}
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_space_char = ' '
vim.g.indent_blankline_space_char_highlight_list = {'IndentOdd', 'IndentEven'}
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_quit_on_open = 1
vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
vim.g.ctrlsf_auto_preview = 1
vim.g.ctrlsf_indent = 2
vim.g.ctrlsf_auto_focus = { at = 'start' }
vim.g.ctrlsf_ignore_dir = {'.git', 'node_modules'}
vim.g.ctrlsf_search_mode = 'async'
vim.g.nvim_tree_bindings = {
  { key = 'l', cb = tree_cb('edit') },
  { key = 'h', cb = tree_cb('close_node') },
  { key = '<Tab>', mode = 'n', cb = ':lua NvimTreeToggleFileSelected("j")<cr>'},
  { key = '<S-Tab>', mode = 'n', cb = ':lua NvimTreeToggleFileSelected("k")<cr>'},
  { key = '<cr>', mode = 'n', cb = ':lua NvimTreeOpenFiles()<cr>'},
}

local function esearch_write_cb(buf)
  -- vim.cmd('{buf, bang -> buf.write(bang) && (!buf.existed && buf.bwipeout())}')
end

vim.g.esearch = {
  textobj = 0,
  default_mappings = 0,
  write_cb = esearch_write_cb
}
