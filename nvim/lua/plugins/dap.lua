local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          -- {
          --   type = "pwa-node",
          --   request = "launch",
          --   name = "Launch file",
          --   program = "${file}",
          --   cwd = vim.fn.getcwd(),
          --   sourceMaps = true,
          -- },
          {
            type = "pwa-node",
            request = "launch",
            name = "STAGING run ts-node on current file",
            cwd = vim.fn.getcwd(),
            env = { NODE_ENV = 'staging' },
            runtimeArgs = { "--swc" },
            runtimeExecutable = "ts-node",
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "PRODUCTION run ts-node on current file",
            cwd = vim.fn.getcwd(),
            env = { NODE_ENV = 'prod' },
            runtimeArgs = { "--swc" },
            runtimeExecutable = "ts-node",
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          -- {
          --   type = "pwa-node",
          --   request = "launch",
          --   name = "Launch Current File (pwa-node with ts-node) STAGING",
          --   cwd = vim.fn.getcwd(),
          --   env = { NODE_ENV = 'staging' },
          --   runtimeArgs = { "--loader", "ts-node/esm" },
          --   runtimeExecutable = "node",
          --   args = { "${file}" },
          --   sourceMaps = true,
          --   protocol = "inspector",
          --   skipFiles = { "<node_internals>/**", "node_modules/**" },
          --   resolveSourceMapLocations = {
          --     "${workspaceFolder}/**",
          --     "!**/node_modules/**",
          --   },
          -- },
          -- {
          --   type = "pwa-node",
          --   request = "launch",
          --   name = "Launch Current File (pwa-node with ts-node) PROD",
          --   cwd = vim.fn.getcwd(),
          --   env = { NODE_ENV = 'prod' },
          --   runtimeArgs = { "--loader", "ts-node/esm" },
          --   runtimeExecutable = "node",
          --   args = { "${file}" },
          --   sourceMaps = true,
          --   protocol = "inspector",
          --   skipFiles = { "<node_internals>/**", "node_modules/**" },
          --   resolveSourceMapLocations = {
          --     "${workspaceFolder}/**",
          --     "!**/node_modules/**",
          --   },
          -- },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Test Current File (pwa-node with jest)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
            runtimeExecutable = "node",
            args = { "${file}", "--coverage", "false" },
            rootPath = "${workspaceFolder}",
            sourceMaps = true,
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            name = "Launch NestJS (Debug Mode)",
            type = "pwa-node",
            request = "launch",
            cwd = vim.fn.getcwd(),
            runtimeExecutable = "npm", -- Specify npm as the runtime executable
            args = { "run", "start:shlomo" }, -- Pass the run command and script name as arguments
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            -- outFiles = { "${workspaceFolder}/dist/**/*.js" },
            skipFiles = {
              "${workspaceFolder}/node_modules/**/*.js",
              "<node_internals>/**",
            },
          },
          -- Debug nodejs processes (make sure to add --inspect when you run the process)
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = function() require("dap.utils").pick_process({ filter = "--neovim-debug" }) end,
            -- processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = false,
            skipFiles = {
              "<node_internals>/**",
              "node_modules/**",
            }
          },
          -- Debug web applications (client side)
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = "Enter URL: ",
                  default = "http://localhost:3000",
                }, function(url)
                  if url == nil or url == "" then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            -- sourceMaps = true,
            userDataDir = false,
          },
        }
      end
    end,
    keys = {
      {
        "<leader>dt",
        function()
          local dap = require("dap")
          local session = dap.session()
          if session and session.parent then
            dap.set_session(session.parent)
          end
          dap.terminate()

          -- local session_to_activate = nil
          -- local sessions = dap.sessions()

          -- for _, s in pairs(sessions) do
          --   session_to_activate = s
          --   break
          -- end

          -- if session_to_activate ~= nil then
          --   dap.set_session(session_to_activate)
          -- end

          -- dap.terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dx",
        function()
          local dap = require("dap")
          dap.terminate(
            {},
            {
              terminateDebugee = true
            },
            function()
              dap.close()
            end
          )
        end,
        {
          desc = "Stop Debugger",
          exit = false,
          private = true,
          silent = true
        }
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Dap UI toggle",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dd",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle break point",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Step Over",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
          require("dapui").eval()
        end,
        desc = "Evaluate",
      },
      {
        "<leader>da",
        function()
          if vim.fn.filereadable(".vscode/launch.json") then
            local dap_vscode = require("dap.ext.vscode")
            dap_vscode.load_launchjs(nil, {
              ["pwa-node"] = js_based_languages,
              ["chrome"] = js_based_languages,
              ["pwa-chrome"] = js_based_languages,
            })
          end
          require("dap").continue()
        end,
        desc = "Run with Args",
      },
    },
    dependencies = {
      { "rcarriga/nvim-dap-ui", opts = {
        layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          } },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 10
      } },
      }, dependencies = { "nvim-neotest/nvim-nio" } },
      { "theHamsta/nvim-dap-virtual-text", opts = { enabled = true, virt_text_pos = 'inline' } },
      -- Install the vscode-js-debug adapter
      {
        "microsoft/vscode-js-debug",
        -- After install, build it and rename the dist directory to out
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("dap-vscode-js").setup({
            -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- node_path = "node",

            -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

            -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
            -- debugger_cmd = { "js-debug-adapter" },

            -- which adapters to register in nvim-dap
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
            },

            -- Path for file logging
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

            -- Logging level for output to file. Set to false to disable logging.
            -- log_file_level = false,

            -- Logging level for output to console. Set to false to disable console output.
            -- log_console_level = vim.log.levels.ERROR,
          })
        end,
      },
      {
        "Joakker/lua-json5",
        build = "./install.sh",
      },
    },
  },
}
