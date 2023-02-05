local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local colors = {
  blue   = '#34a1eb',
  blue2  = '#00509d',
  cyan   = '#79dac8',
  green  = '#50fa7b',
  black  = '#000000',
  white  = '#ffffff',
  red    = '#ff5555',
  pink   = '#ff79c6',
  purple = '#6272a4',
  violet = '#bd93f9',
  grey   = '#303030',
  yellow = '#ffff00',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black,  bg = colors.green },
    b = { fg = colors.black,  bg = colors.violet },
    c = { fg = colors.yellow, bg = colors.black },
    x = { fg = colors.black,  bg = colors.blue },
    y = { fg = colors.black,  bg = colors.violet },
    z = { fg = colors.black,  bg = colors.green },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.yellow } },
  replace = { a = { fg = colors.black, bg = colors.pink } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

lualine.setup({
  options = {
    theme = bubbles_theme,
    -- theme = 'tokyonight',
    component_separators = '',
    -- section_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      -- { 'mode', separator = { left = '' }, right_padding = 2 },
      { 'mode', separator = { right = '' }, right_padding = 2 },
    },
    -- lualine_b = { 'filename', 'branch', 'diff', { 'diagnostics', sources = { 'nvim_diagnostic' } } },
    lualine_b = { { 'branch', separator = { right = '' } } },
    lualine_c = {
      -- {
      --   'filename',
      --   file_status = true,
      --   path = 1,
      --   shorting_target = 40,
      --   symbols = {
      --     modified = '[+]',
      --     readonly = '[-]',
      --     unnamed = '[No Name]',
      --   }
      -- },
      { 'diagnostics' }
    },
    -- lualine_c = { require('auto-session-library').current_session_name },
    -- lualine_x = { { 'filetype', separator = { left = '' } } },
    lualine_x = { { 'filetype', separator = { left = '' } } },
    lualine_y = { {'location', separator = { left = '' } } },
    lualine_z = {
      -- { 'os.date("%H:%M", os.time())', separator = { right = '' }, left_padding = 2 },
      -- { 'progress', separator = { right = '' }, left_padding = 2 },
      { 'progress', separator = { left = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'},
  },
  -- tabline = {},
  extensions = {},
})

-- Trigger rerender of status line every second for clock
-- if _G.Statusline_timer == nil then
--     _G.Statusline_timer = vim.loop.new_timer()
-- else
--     _G.Statusline_timer:stop()
-- end
-- _G.Statusline_timer:start(0, 1000, vim.schedule_wrap(
--                               function() vim.api.nvim_command('redrawstatus') end))
