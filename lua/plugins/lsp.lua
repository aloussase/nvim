return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- npm install -g @astrojs/language-server
      lsp.astro.setup({ capabilities = capabilities })

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
        end
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(args)
          vim.lsp.buf.format({
            bufnr = args.buffer,
            async = false
          })
        end
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
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
}
