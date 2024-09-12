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
          "c",
          function()
            require("dap").continue()
          end,
          { desc = "Continue", nowait = true },
        },
        {
          "a",
          function()
            require("dap").continue({ before = get_args })
          end,
          { desc = "Run with args", nowait = true },
        },
        {
          "i",
          function()
            require("dap").step_into()
          end,
          { desc = "Step Into", nowait = true },
        },
        {
          "n",
          function()
            require("dap").step_over()
          end,
          { desc = "Step Over", nowait = true },
        },
        {
          "o",
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
