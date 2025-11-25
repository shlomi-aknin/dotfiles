return  {
  'MagicDuck/grug-far.nvim',
  config = function ()
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('grug-far-keybindings', { clear = true }),
      pattern = { 'grug-far' },
      callback = function()
        vim.keymap.set('n', '<C-l>', function()
          require('grug-far').get_instance(0):open_location()
          require('grug-far').get_instance(0):close()
        end, { buffer = true })
      end,
    })
  end
  -- config = function()
  --   -- optional setup call to override plugin options
  --   -- alternatively you can set options with vim.g.grug_far = { ... }
  --   require('grug-far').setup({
  --     -- options, see Configuration section below
  --     -- there are no required options atm
  --   });
  -- end
}
