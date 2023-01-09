local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  return
end

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_cenfig'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_cenfig'] = function()
  dapui.close()
end

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    expand = { '<CR>', 'x' },
    open = { 'o' },
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  expand_lines = vim.fn.has('nvim-0.7'),
  layouts = {
    {
      elements = {
        -- { id = 'scopes', size = 0.25 },
        'stacks',
        'breakpoints',
        'scopes',
        -- 'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'watches',
        -- 'repl',
        -- 'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = 'single',
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  }
})
