return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<F4>", function() require("dapui").eval() end, desc = "Toggle Dap UI" },
    { "<F5>", function() require("dap").continue() end, desc = "Continue/Start Debugging" },
    { "<F6>", function() require("dap").terminate() end, desc = "Terminate Debugging" },
    { "<F7>", function() require("dapui").toggle({}) end, desc = "Toggle Dap UI" },
    { "<F8>", function() require("dap").repl.open() end, desc = "Open REPL" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
    { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
    { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Toggle Dap UI" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue/Start Debugging" },
    { "<leader>dT", function() require("dap").terminate() end, desc = "Terminate Debugging" },
    { "<leader>dt", function() require("dapui").toggle({}) end, desc = "Toggle Dap UI" },
    { "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "js-debug-adapter")
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = {},
      config = function()
              local dap, dapui = require("dap"), require("dapui")
              dapui.setup()
              dap.listeners.before.attach.dapui_config = function()
                dapui.open({})
              end
              dap.listeners.before.launch.dapui_config = function()
                dapui.open({})
              end
              -- dap.listeners.before.event_terminated.dapui_config = function()
              --   dapui.close({})
              -- end
              -- dap.listeners.before.event_exited.dapui_config = function()
              --   dapui.close({})
              -- end
      end,
      dependencies = { "nvim-neotest/nvim-nio" }
    },
  },
  config = function()
    vim.fn.sign_define('DapBreakpoint', {text='󰧟', texthl='', linehl='', numhl=''})
    -- vim.fn.sign_define('DapStopped', {text='󰜴', texthl='', linehl='', numhl=''})
    local dap = require("dap")
    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "/usr/local/bin/node",
          args = {
      vim.fn.stdpath('data') .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end
    if not dap.adapters["node"] then
      dap.adapters["node"] = function(cb, config)
        if config.type == "node" then
          config.type = "pwa-node"
        end
        local nativeAdapter = dap.adapters["pwa-node"]
        if type(nativeAdapter) == "function" then
          nativeAdapter(cb, config)
        else
          cb(nativeAdapter)
        end
      end
    end

    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

    local vscode = require("dap.ext.vscode")
    vscode.type_to_filetypes["node"] = js_filetypes
    vscode.type_to_filetypes["pwa-node"] = js_filetypes

    for _, language in ipairs(js_filetypes) do
      if not dap.configurations[language] then
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "${workspaceFolder}/node_modules/.bin/ts-node",
            runtimeArgs = { "--swc" },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end
  end,
}
