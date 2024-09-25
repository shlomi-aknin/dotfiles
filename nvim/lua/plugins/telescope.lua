return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-dap.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    { 'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0' },
  },
  config = function ()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = {
          'node_modules', 'build', 'dist', 'yarn.lock', '.git'
        },
        -- preview = {
        --   hide_on_startup = true
        -- },
        mappings = {
          n = {
            ['<C-l>'] = actions.select_default,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-x>'] = actions.delete_buffer,
          },
          i = {
            ['<C-l>'] = actions.select_default,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-x>'] = actions.delete_buffer,
          }
        }
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({})
        }
      }
    })
    require('telescope').load_extension('ui-select')
    require('telescope').load_extension('dap')
    require('telescope').load_extension('live_grep_args')
  end
}
