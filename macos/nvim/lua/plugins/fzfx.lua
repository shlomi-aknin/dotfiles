return {
    "linrongbin16/fzfx.nvim",
    -- Optional to avoid break changes between major versions.
    version = "v8.*",
    dependencies = { "nvim-tree/nvim-web-devicons", 'junegunn/fzf' },
    config = function()
      require("fzfx").setup()
    end,
  }
