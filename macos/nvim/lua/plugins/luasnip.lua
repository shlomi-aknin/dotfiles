return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })

    -- Ensure JS snippets (including Jest) are available in TS/TSX/JSX
    local luasnip = require("luasnip")
    luasnip.filetype_extend("typescript", { "javascript" })
    luasnip.filetype_extend("typescriptreact", { "javascript", "javascriptreact" })
    luasnip.filetype_extend("javascriptreact", { "javascript" })
  end
}
