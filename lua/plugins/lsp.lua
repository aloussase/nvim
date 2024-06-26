return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- npm install -g @astrojs/language-server
      lsp.astro.setup({ capabilities = capabilities })

      -- dotnet tool install --global csharp-ls
      -- lsp.csharp_ls.setup({ capabilities = capabilities })

      lsp.hls.setup({
        filetypes = { "haskell", "cabal" },
        settings = {
          haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "stylish-haskell"
          }
        }
      })

      lsp.dartls.setup({ capabilities = capabilities })
      lsp.sourcekit.setup({ capabilities = capabilities })

      -- npm install -g typescript typescript-language-server
      lsp.tsserver.setup({
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      })

      -- npm install -g @vue/language-server
      lsp.volar.setup({ capabilities = capabilities })

      lsp.omnisharp.setup({
        capabilities = capabilities,
        cmd = { "/home/aloussase/Projects/omnisharp/OmniSharp" },
        settings = {
          RoslynExtensionsOptions = {
            enableImportCompletion = true,
            enableAnalyzerSupport = true,
          },
          FormattingOptions = {
            OrganizeImports = true,
            WrappingPreserveSingleLine = false,
            WrappingKeepStatementsOnSingleLine = false,
          },
        },
      })

      -- npm install -g @tailwindcss/language-server
      lsp.tailwindcss.setup({ capabilities = capabilities })

      lsp.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim"
              }
            }
          }
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
          vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, { buffer = args.buf })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = args.buf })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = args.buf })
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = args.buf })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = args.buf })
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = args.buf })
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = args.buffer })
        end
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
              callback = function()
                vim.lsp.buf.format({ async = false })
              end
            })
          end
        end
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'ultisnips' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' }
        })
      })
    end
  },
  {
    'j-hui/fidget.nvim',
    tag = "v1.0.0",
    config = function()
      require('fidget').setup({})
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      height = 5,
      modes = {
        diagnostics = {
          auto_open  = true,
          auto_close = true,
        },
      },
    },
  }
}
