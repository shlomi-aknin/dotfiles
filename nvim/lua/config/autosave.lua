local autosave = require('autosave')

autosave.setup({
  enabled = true,
  execution_message = 'AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S'),
  events = {'TextChanged'},
  conditions = {
    exists = true,
    filename_is_not = {},
    filetype_is_not = {},
    modifiable = true
  },
  write_all_buffers = false,
  on_off_commands = false,
  clean_command_line_interval = 5000,
  debounce_delay = 135
})

autosave.hook_before_saving = function ()
  vim.api.nvim_exec([[
    autocmd BufWritePost *.js,*.svelte,*.html,*.css Format
  ]], true)
end
