return {
    "nvimtools/hydra.nvim",
    config = function()
    local Hydra = require('hydra')
    local dap = require('dap')
    Hydra({
      name = "Debug",
      mode = { "n" },
      body = "D",
      config = {
        invoke_on_body = true,
      },
      heads = {
        {
          "b",
          dap.toggle_breakpoint,
          { desc = "Toggle Breakpoint" },
        },
        {
          "K",
          function()
            require("dap").continue()
          end,
          { desc = "Continue", nowait = true },
        },
        {
          "L",
          function()
            require("dap").step_into()
          end,
          { desc = "Step Into", nowait = true },
        },
        {
          "J",
          function()
            require("dap").step_over()
          end,
          { desc = "Step Over", nowait = true },
        },
        {
          "H",
          function()
            require("dap").step_out()
          end,
          { desc = "Step Out", nowait = true },
        },
        {
          "q",
          function()
            require("dap").terminate()
          end,
          { desc = "Terminate", nowait = true },
        },
      },
    })
    end
}
