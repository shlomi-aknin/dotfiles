local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

require('dap.ext.vscode').load_launchjs('.vscoe/launch.json')

dap.adapters.node2 = {
  type = 'executable',
  command = '/usr/local/bin/node',
  args = {vim.fn.stdpath('data')..'/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
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
  -- {
  --   name = 'Process Worker Job',
  --   type = 'node2',
  --   command = 'node',
  --   args = { "--inspect-brk", "--require", "ts-node/register", "-r", "tsconfig-paths/register"  },
  --   request = 'launch',
  --   -- runtimeArgs = { "--require", "ts-node/register", "-r", "tsconfig-paths/register" },
  --   program = "/home/shlomo/workspace/cymbio-api-3/scripts/core/processWorkerJob.ts",
  --   -- runtimeExecutable = "node",
  --   cwd = "/home/shlomo/workspace/cymbio-api-3/scripts/core/",
  --   sourceMaps = true,
  --   protocol = 'inspector',
  --   skipFiles = {'<node_internals>/**/*.js'},
  --   console = 'integratedTerminal',
  --   -- disableOptimisticBPs = true,
  --   outFiles = { "${workspaceFolder}/**/*.js" },
  -- },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
  -- {
  --   name = 'Launch',
  --   type = 'node2',
  --   args = { "--inspect-brk", "--require", "ts-node/register", "-r", "tsconfig-paths/register"  },
  --   request = 'launch',
  --   program = '${file}',
  --   cwd = vim.fn.getcwd(),
  --   sourceMaps = true,
  --   protocol = 'inspector',
  --   console = 'integratedTerminal',
  --   port = 9229,
  --   outFiles = { "${workspaceFolder}/**/*.js" },
  -- },
}

vim.fn.sign_define('DapBreakpoint', {text='ﴫ', texthl='BreakPoint', linehl='', numhl=''})
