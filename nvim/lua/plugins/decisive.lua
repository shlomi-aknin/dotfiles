return {
  "emmanueltouzery/decisive.nvim",
  opts = {},
  lazy = true,
  ft = {'csv'},
  keys = {
    { '<leader>cca', ":lua require('decisive').align_csv({})<cr>",       { silent = true }, desc = "Align CSV",          mode = 'n' },
  }
}
