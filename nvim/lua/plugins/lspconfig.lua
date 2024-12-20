-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    {'folke/neodev.nvim' },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Update this list to the language servers you need installed
      ensure_installed = {
        -- "bashls", # requires npm to be installed
        -- "cssls", # requires npm to be installed
        -- "html", # requires npm to be installed
        -- "gradle_ls",
        -- "groovyls",
        "lua_ls",
        "sqls",
        "eslint",
        -- "intelephense", # requires npm to be installed
        -- "jsonls", # requires npm to be installed
        -- "lemminx",
        -- "marksman",
        -- "quick_lint_js",
        -- "tsserver",
        "ts_ls",
        -- "yamlls", # requires npm to be installed
      }
    })

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
      -- require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end

    -- Call setup on each LSP server
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end
    })

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
      }
      vim.lsp.buf.execute_command(params)
    end

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }

    lspconfig.eslint.setup({
      settings = {
        packageManager = 'npm'
      },
      capabilities = lsp_capabilities,
      ---@diagnostic disable-next-line: unused-local
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    lspconfig.ts_ls.setup {
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports"
        }
      }
    }
  end
}
