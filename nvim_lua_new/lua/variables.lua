local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_bindings = {
	{ key = 'l', 				cb = tree_cb('edit') },
	{ key = 'h',                            cb = tree_cb('close_node') },
}
