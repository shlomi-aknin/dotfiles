return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  config = function ()
    vim.g.dbs = {
      mysql_local = vim.env.MYSQL_LOCAL,
      mysql_staging = vim.env.MYSQL_STAGING,
      mysql_production = vim.env.MYSQL_PRODUCTION,
      redis_staging = vim.env.REDIS_STAGING,
      redis_production = vim.env.REDIS_PRODUCTION,
    }
  end
}
