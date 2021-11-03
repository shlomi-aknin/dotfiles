require('lsp_signature').setup({
  bind = true,
  doc_lines = 20,
  floating_window = true,
  floating_window_above_cur_line = true,
  fix_pos = true,
  hint_enable = true,
  hint_prefix = '🐼 ',
  use_lspsaga = false,
  hi_parameter = 'PMenuSel',
  max_height = 12,
  max_width = 250,
  transpancy = 10,
  handler_opts = {
    border = 'none'
  },
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},
  zindex = 200,
  padding = ' ',
  timer_interval = 10, -- default timer check interval set to lower value if you want to reduce latency
})
