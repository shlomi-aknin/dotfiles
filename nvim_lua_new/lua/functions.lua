local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local custom_actions = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function custom_actions.fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = table.getn(picker:get_multi_selection())

  if num_selections > 1 then
    local picker = action_state.get_current_picker(prompt_bufnr)
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format("%s %s", ":e!", entry.value))
    end
    vim.cmd('stopinsert')
  else
    actions.file_edit(prompt_bufnr)
  end
end

require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      '--color=always',
    },
    prompt_prefix = "@ ",
    layout_config = {
      preview_width = 0.6
    },
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = { 
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<cr>'] = custom_actions.fzf_multi_select,
      },
      n = {
        ['<esc>'] = actions.close,
        ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<cr>'] = custom_actions.fzf_multi_select
      }
    },
  }
})

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'dracula',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename', 'diff'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})

require('bufferline').setup()
require 'lsp_signature'.setup({
  bind = true,
  hi_parameter = 'PMenuSel',
  handler_opts = {
    border = 'shadow'
  },
})

require('nvim-autopairs').setup()
require('nvim-autopairs.completion.compe').setup({ map_cr = true, map_complete = true })
require('hop').setup()
require('nvim_comment').setup({ comment_empty = false, create_mappings = false })
require('nvim-ts-autotag').setup()
require('lspsaga').init_lsp_saga()
require('spectre').setup()
require('goto-preview').setup()
-- require('autosave').setup()
require('specs').setup({ 
  show_jumps  = true,
  min_jump = 1,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 10, -- time increments used for fade/resize effects 
    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 100,
    winhl = 'PMenu',
    fader = require('specs').pulse_fader,
    resizer = require('specs').slide_resizer
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
})

require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  }
})

require('neoscroll').setup({
  hide_cursor = false,
  easing_function = 'circular',
})

require('compe').setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 10;
  source_timeout = 200;
  resolve_timeout = 10;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', '' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
})

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-n>')
  elseif check_back_space() then
    return t('<Tab>')
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-p>')
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t('<S-Tab>')
  end
end

local function setup_servers()
  require('lspinstall').setup()
  local servers = require('lspinstall').installed_servers()
  for _, server in pairs(servers) do
    require('lspconfig')[server].setup{}
  end
end

setup_servers()

require('lspinstall').post_install_hook = function ()
  setup_servers()
  vim.cmd('bufdo e')
end

require('lspkind').init({
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="HighlightedyankRegion", timeout=1200}
  augroup END
  au! BufNewFile,BufRead *.svelte set ft=html
]])

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  direction = 'float'
})

function _lazygit_toggle()
  lazygit:toggle()
end

local prettier = function()
  return {
    exe = 'prettier',
    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0), '--single-quote'},
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    css = { prettier },
    html = { prettier },
    javascript = { prettier },
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.css,*.html,*.js,*.svelte FormatWrite
augroup END
]], true)
