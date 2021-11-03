require('spectre').setup({
  live_update = true,
  line_sep_start = '==========================================',
  result_padding = '~> ',
  line_sep       = '==========================================',
  highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete"
  },
  is_open_target_win = true,
  is_insert_mode = true,
})
