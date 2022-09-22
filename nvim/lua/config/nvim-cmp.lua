local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end

local status_ok, lspkind = pcall(require, 'lspkind')
if not status_ok then
  return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
cmp.setup({
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noinsert,preview'
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({ with_text = true, menu = ({
      buffer        = '[Buf]',
      cmp_tabnine   = '[TN]',
      vsnip         = '[Snip]',
      nvim_lsp      = '[LSP]',
      path          = '[Path]',
      luasnip       = '[Snip]',
      nvim_lua      = '[Lua]',
      latex_symbols = '[Latex]',
    })}),
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-c>']     = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-i>']     = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-j>']     = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
    ['<C-k>']     = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
    ['<C-l>']     = cmp.mapping.confirm({ select = true }),
    ['<C-u>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-y>']     = cmp.config.disable,
    ['<CR>']      = cmp.mapping.confirm({ select = true }),
    ['<S-Tab>']   = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
    ['<Tab>']     = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    -- { name = 'cmp_tabnine' },
    { name = 'path' },
    { name = 'buffer' },
  }, {
    { name = 'buffer' },
  }),
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'fuzzy_buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' }
  })
})
