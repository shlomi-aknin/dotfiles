return {
  "kopecmaciej/vi-mongo.nvim",
  config = function()
    require("vi-mongo").setup({
      persist = false,
    })
  end,
  cmd = { "ViMongo" },
  keys = {
    { "<leader>vm", "<cmd>ViMongo<cr>", desc = "ViMongo" }
  }
}
