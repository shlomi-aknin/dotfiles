require('nvim-treesitter.configs').setup({
  ensure_installed = { 'css', 'html', 'javascript', 'php', 'svelte' },
  ignore_install = {},
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true
  },
})
