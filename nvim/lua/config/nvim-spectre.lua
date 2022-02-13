require('spectre').setup({
  open_cmd = 'enew',
  live_update = true,
  line_sep_start = '==========================================',
  result_padding = '~> ',
  line_sep       = '==========================================',
  highlight = {
      ui = "String",
      search = "Search",
      replace = "IncSearch"
  },
  is_open_target_win = true,
  is_insert_mode = true,
  mapping = {
    ['enter_file'] = {
      map = "<leader>l",
      cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
      desc = "goto current file"
    },
    ['run_replace'] = {
      map = "<leader>r",
      cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
      desc = "replace all"
    },
  },
})
