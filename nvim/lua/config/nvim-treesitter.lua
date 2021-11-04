require('nvim-treesitter.configs').setup({
  ensure_installed = { 'css', 'html', 'javascript', 'php', 'svelte' },
  ignore_install = {},
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
})
