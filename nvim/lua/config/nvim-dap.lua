local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/programs/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

dap.configurations.typescript = {
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
  -- {
  --   name = 'Launch',
  --   type = 'node2',
  --   request = 'launch',
  --   program = '${file}',
  --   cwd = vim.fn.getcwd(),
  --   sourceMaps = true,
  --   protocol = 'inspector',
  --   console = 'integratedTerminal',
  --   port = 9229,
  -- },
}

vim.fn.sign_define('DapBreakpoint', {text='ﴫ', texthl='BreakPoint', linehl='', numhl=''})
