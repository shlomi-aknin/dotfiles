return {
	'maxmx03/dracula.nvim',
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
  opts = {},
	config = function ()
		vim.cmd.colorscheme 'dracula'
	end
}
