return {
  -- https://github.com/nvim-lualine/lualine.nvim
  'nvim-lualine/lualine.nvim',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- fancy icons
    -- https://github.com/linrongbin16/lsp-progress.nvim
    'linrongbin16/lsp-progress.nvim', -- LSP loading progress
  },
  config = function ()
    local custom_dracula = require'lualine.themes.dracula'
    custom_dracula.normal.a.bg = '#50FA7B'
    custom_dracula.insert.a.bg = '#BD93F9'
    custom_dracula.replace.a.bg = '#6272A4'
    custom_dracula.replace.a.fg = '#F8F8F2'

    require('lualine').setup({
    options = {
      section_separators = {
        left = "",
        right = ""
      },
      theme = custom_dracula, -- lualine theme
    },
    sections = {
      -- lualine_a = {
      --   {
      --     -- Customize the filename part of lualine to be parent/filename
      --     'filename',
      --     file_status = true,      -- Displays file status (readonly status, modified status)
      --     newfile_status = false,  -- Display new file status (new file means no write after created)
      --     path = 4,                -- 0: Just the filename
      --                              -- 1: Relative path
      --                              -- 2: Absolute path
      --                              -- 3: Absolute path, with tilde as the home directory
      --                              -- 4: Filename and parent dir, with tilde as the home directory
      --     symbols = {
      --       modified = '[+]',      -- Text to show when the file is modified.
      --       readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
      --     }
      --   }
      -- },
      lualine_c = {
        function()
          return require('lsp-progress').progress()
        end,
      },
      lualine_x = {'encoding', 'filetype'},
    }
  })
  end,
}
