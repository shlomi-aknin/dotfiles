local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  return
end

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = {'<CR>', 'i'},
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with 'id' and 'size' keys
      { id = 'breakpoints', size = 0.25 },
      { id = 'stacks', size = 0.65 },
      -- { id = 'scopes', size = 0.45 },
      { id = 'repl', size = 0.10 },
      -- { id = 'watches', size = 0.25 },
    },
    size = 30,
    position = 'left', -- Can be 'left', 'right', 'top', 'bottom'
  },
  tray = {
    elements = { 'scopes' },
    size = 10,
    position = 'bottom', -- Can be 'left', 'right', 'top', 'bottom'
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'single', -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
})
