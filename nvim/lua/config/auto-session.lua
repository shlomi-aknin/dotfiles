local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = { '~/.config/nvim/lua' },
  bypass_session_save_file_types = nil
}

require('auto-session').setup(opts)
