-- Auto-completion / Snippets
return {
  -- https://github.com/hrsh7th/nvim-cmp
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet engine & associated nvim-cmp source
    -- https://github.com/L3MON4D3/LuaSnip
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function ()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip").filetype_extend("typescript", { "javascript" })
      end
    },
    -- https://github.com/saadparwaiz1/cmp_luasnip
    'saadparwaiz1/cmp_luasnip',

    -- LSP completion capabilities
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',

    -- Additional user-friendly snippets
    -- https://github.com/rafamadriz/friendly-snippets
    'rafamadriz/friendly-snippets',
    -- https://github.com/hrsh7th/cmp-buffer
    'hrsh7th/cmp-buffer',
    -- https://github.com/hrsh7th/cmp-path
    'hrsh7th/cmp-path',
    -- https://github.com/hrsh7th/cmp-cmdline
    'hrsh7th/cmp-cmdline',
    'onsails/lspkind.nvim',
    {
      "MattiasMTS/cmp-dbee",
      dependencies = {
        {"kndndrj/nvim-dbee"}
      },
      ft = "sql", -- optional but good to have
      opts = {
        sources = {
          { "cmp-dbee" },
        },
      },
    },
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local lspkind = require('lspkind')

    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-c>"] = cmp.mapping.abort(), -- clear completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
        ["<C-l>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
      }),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmp-dbee' }, -- database
      }, {
          { name = 'cmdline' }
        }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-c>"] = cmp.mapping.abort(), -- clear completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
        ["<C-l>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
      }),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          })
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-c>"] = cmp.mapping.abort(), -- clear completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
        ["<C-l>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        { name = 'nvim_lsp_signature_help' }, -- lsp signature
        { name = 'cmp-dbee' }, -- database
      }),
    })
  end,
 }
