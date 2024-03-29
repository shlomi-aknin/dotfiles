local cb = require('diffview.config').diffview_callback
local last_tabpage = vim.api.nvim_get_current_tabpage()
local isopen = false
local log_options = {
  max_count = 256,
  follow = false,
  all = false,
  merges = false,
  no_merges = false,
  reverse = false,
}

function DiffviewToggle()
  if isopen then
    vim.cmd('DiffviewClose')
    isopen = false
  else
    vim.cmd('DiffviewOpen')
    isopen = true
  end
end

require('diffview').setup({
  diff_binaries = false,
  enhanced_diff_hl = false,
  use_icons = true,
  icons = {
    folder_closed = '',
    folder_open = '',
  },
  signs = {
    fold_closed = '',
    fold_open = '',
  },
  file_panel = {
    win_config = {
      position = 'left',
      width = 35,
      height = 10,
    },
    listing_style = 'tree',
    tree_options = {
      flatten_dirs = true,
      folder_statuses = 'only_folded',
    },
  },
  file_history_panel = {
    win_config = {
      position = 'bottom',
      width = 35,
      height = 16,
    },
    log_options = {
      git = {
        single_file = log_options,
        multi_file = log_options,
      }
    },
  },
  default_args = {
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},
  key_bindings = {
    disable_defaults = false,

    view = {
      ['<C-j>']       = cb('select_next_entry'),
      ['<C-k>']       = cb('select_prev_entry'),
      ['gf']          = cb('goto_file'),
      ['<C-w><C-s>']  = cb('goto_file_split'),
      ['<C-l>']       = cb('goto_file_tab'),
      ['<C-w><C-f>']  = cb('focus_files'),
      ['<C-w><C-t>']  = cb('toggle_files'),
    },
    file_panel = {
      ['j']             = cb('next_entry'),
      ['<down>']        = cb('next_entry'),
      ['k']             = cb('prev_entry'),
      ['<up>']          = cb('prev_entry'),
      ['<cr>']          = cb('select_entry'),
      ['l']             = cb('select_entry'),
      ['o']             = cb('select_entry'),
      ['<2-LeftMouse>'] = cb('select_entry'),
      ['s']             = cb('toggle_stage_entry'),
      ['S']             = cb('stage_all'),
      ['U']             = cb('unstage_all'),
      ['X']             = cb('restore_entry'),
      ['R']             = cb('refresh_files'),
      ['<C-j>']         = cb('select_next_entry'),
      ['<C-k>']         = cb('select_prev_entry'),
      ['gf']            = cb('goto_file'),
      ['<C-w><C-s>']    = cb('goto_file_split'),
      ['<C-w><C-t>']    = cb('goto_file_tab'),
      ['i']             = cb('listing_style'),
      ['f']             = cb('toggle_flatten_dirs'),
      ['<C-w><C-f>']    = cb('focus_files'),
      ['<C-w><C-t>']    = cb('toggle_files'),
    },
    file_history_panel = {
      ['g!']            = cb('options'),
      ['<C-A-d>']       = cb('open_in_diffview'),
      ['y']             = cb('copy_hash'),
      ['zR']            = cb('open_all_folds'),
      ['zM']            = cb('close_all_folds'),
      ['j']             = cb('next_entry'),
      ['<down>']        = cb('next_entry'),
      ['k']             = cb('prev_entry'),
      ['<up>']          = cb('prev_entry'),
      ['<cr>']          = cb('select_entry'),
      ['o']             = cb('select_entry'),
      ['<2-LeftMouse>'] = cb('select_entry'),
      ['<tab>']         = cb('select_next_entry'),
      ['<s-tab>']       = cb('select_prev_entry'),
      ['gf']            = cb('goto_file'),
      ['<C-w><C-f>']    = cb('goto_file_split'),
      ['<C-w>gf']       = cb('goto_file_tab'),
      ['<leader>e']     = cb('focus_files'),
      ['<leader>b']     = cb('toggle_files'),
    },
    option_panel = {
      ['<tab>'] = cb('select'),
      ['<C-l>'] = cb('select'),
      ['q']     = cb('close'),
    },
  },
})
