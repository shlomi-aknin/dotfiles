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

function custom_actions.yank_file()
  local action_state = require('telescope.actions.state')
  local entry = action_state.get_selected_entry()
  copy_to_clipboard(entry.path)
end

function copy_to_clipboard(content)
  vim.fn.setreg('+', content);
  vim.fn.setreg('"', content);
  return print(string.format('Copied %s to system clipboard! \n', content))
end

function spectre_open_all()
  local entries = require('spectre.actions').get_all_entries()
  for _,entry in pairs(entries) do
    vim.cmd(string.format('%s %s', ':e!', entry.filename))
  end
end

require('spectre').setup({
  color_devicons = true,
  line_sep_start = '******************************************',
  result_padding = '~>  ',
  line_sep       = '******************************************',
  highlight = {
      ui = 'String',
      search = 'Search',
      replace = 'Folded'
  },
  mapping = {
    ['run_replace'] = {
        map = 'R',
        cmd = '<cmd>lua require("spectre.actions").run_replace()<CR>',
        desc = 'replace all'
    },
    ['enter_file'] = {
        map = '<cr>',
        cmd = '<cmd>lua spectre_open_all()<cr>',
        desc = 'goto current file'
    },
  },
})

require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      '--color=always',
    },
    prompt_prefix = '@ ',
    layout_config = {
      preview_width = 0.6
    },
    file_ignore_patterns = { 'node_modules', '.git' },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-y>'] = custom_actions.yank_file,
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

require('stay-centered')
require('bufferline').setup({
  options = {
    indicator_icon = '',
    separator_style = { '', '' },
    enforce_regular_tabs = true,
    show_close_icon = false,
    buffer_close_icon = '',
    offsets = {{filetype = 'NvimTree', text = 'File Explorer', text_align = 'center'}},
  },
  highlights = {
    tab = {
      guifg = '#ffffff',
      guibg = '#000000'
    },
    tab_selected = {
      guifg = 'MatchParen',
      guibg = 'MatchParen'
    },
    buffer_visible = {
      guifg = '#ffffff',
      guibg = '#000000'
    },
    buffer_selected = {
      guifg = '#ffffff',
      guibg = '#2176FF',
      gui = 'bold,italic'
    },
    separator_selected = {
      guifg = '#2176FF',
      guibg = '#2176FF',
    },
    separator_visible = {
      guifg = '#2176FF',
      guibg = '#2176FF',
    },
    separator = {
      guifg = '#2176FF',
      guibg = '#2176FF',
    },
  }
})

require('lsp_signature').setup({
  bind = true,
  hi_parameter = 'PMenuSel',
  handler_opts = {
    border = 'shadow'
  },
})

require('numb').setup()
require('colorizer').setup()
require('nvim-autopairs').setup()
require('nvim-autopairs.completion.compe').setup({ map_cr = true, map_complete = true })
require('hop').setup()
require('nvim_comment').setup({ comment_empty = false, create_mappings = false })
require('nvim-ts-autotag').setup()
require('lspsaga').init_lsp_saga()
require('goto-preview').setup()
require('null-ls').config({})
require('lspconfig')['null-ls'].setup({})
-- require('autosave').setup()
require('specs').setup({
  show_jumps  = true,
  min_jump = 5,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 15, -- time increments used for fade/resize effects
    blend = 5, -- starting blend, between 0-100 (fully transparent), see :h winblend
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
  },
  keymaps = {}
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
  max_abbr_width = 40;
  max_kind_width = 40;
  max_menu_width = 40;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', '' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
    max_width = 80,
    min_width = 30,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = { priority = 500; };
    buffer = { priority = 500; };
    vsnip = { priority = 500; };
    ultisnips = { priority = 500; };
    tabnine = { priority = 500; };
    nvim_lsp = { priority = 500; };
    -- nvim_lua = { priority = 500; };
    -- luasnip = { priority = 500; };
    -- nvim_treesitter = { priority = 500; };
    -- sort = { priority = 500; };
    -- tags = { priority = 500; };
    -- calc = { priority = 500; };
    -- spell = { priority = 500; };
  };
})

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-n>')
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t('<Plug>(vsnip-expand-or-jump)')
  elseif check_back_space() then
    return t('<Tab>')
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-p>')
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t('<Plug>(vsnip-jump-prev)')
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t('<S-Tab>')
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'},
      filetypes = {'html', 'css', 'svelte'},
      root_dir = function(fname)
        return vim.loop.cwd()
      end,
      settings = {},
    }
  }
end
lspconfig.emmet_ls.setup({ capabilities = capabilities; })

require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    local ts_utils = require('nvim-lsp-ts-utils')

    -- defaults
    ts_utils.setup {
      debug = true,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      import_all_priorities = {
        buffers = 4, -- loaded buffer names
        buffer_content = 3, -- loaded buffer content
        local_files = 2, -- git files or files with relative path markers
        same_file = 1, -- add to existing import statement
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- eslint
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = 'eslint',
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = false,
      eslint_show_rule_id = false,

      -- formatting
      enable_formatting = false,
      formatter = 'prettier',
      formatter_config_fallback = nil,

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
    }

    -- required to fix code action ranges
    ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    local opts = {silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', ':TSLspOrganize<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'qq', ':TSLspFixCurrent<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':TSLspRenameFile<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':TSLspImportAll<CR>', opts)
  end
})

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
  set foldlevel=99
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="HighlightedyankRegion", timeout=1200}
  augroup END
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd Filetype * AnyFoldActivate
  autocmd BufEnter *.{css,html,js,svelte} :syntax sync fromstart
  autocmd BufLeave *.{css,html,js,svelte} :syntax sync clear
  let g:prettier#autoformat_require_pragma = 0
  let g:prettier#exec_cmd_async = 1
  let g:prettier#quickfix_enabled = 0
  augroup FormatAutogroup
  autocmd BufWritePost *.{css,html,js,svelte} PrettierAsync
  augroup END
  function! ToggleQuickFix()
      if empty(filter(getwininfo(), 'v:val.quickfix'))
          copen
      else
          cclose
      endif
  endfunction
]])

-- autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'typescript' },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  }
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  direction = 'float'
})

function _lazygit_toggle()
  lazygit:toggle()
end

local NvimTreeSelectedFiles = {}

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function NvimTreeToggleFileSelected(pressed)
  local lib = require('nvim-tree.lib')
  local node = lib.get_node_at_cursor()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local linecolor = 'NormalSelected'..line
  local hl = {}
  if node then
    if NvimTreeSelectedFiles[node.name] == nil then
      vim.cmd('hi! '..linecolor..' guifg=#50fa7b gui=bold')
      vim.api.nvim_buf_add_highlight(0, 0, linecolor, line, 0, -1)
      NvimTreeSelectedFiles[node.name] = node.absolute_path
    else
      vim.cmd('hi! clear '..linecolor)
      NvimTreeSelectedFiles[node.name] = nil
    end
  end
  if pressed == 'j' then
    vim.cmd('normal j')
  elseif pressed == 'k' then
    vim.cmd('normal k')
  end
end

function NvimTreeOpenFiles()
  local lib = require('nvim-tree.lib')
  local view = require('nvim-tree.view')
  local node = lib.get_node_at_cursor()
  local count = tablelength(NvimTreeSelectedFiles)

  if count == 0 then
    if node.has_children ~= nil then
      lib.unroll_dir(node)
    else
      lib.open_file_in_tab(node.absolute_path)
    end
  else
    view.close()
    vim.cmd('enew')
    for _,file in pairs(NvimTreeSelectedFiles) do
      vim.cmd(string.format('%s %s', ':e!', file))
    end
    NvimTreeSelectedFiles = {}
  end
end

