return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require('lspconfig')

      -- npm install -g @astrojs/language-server
      lsp.astro.setup({})

      lsp.lua_ls.setup({
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
    end
  }
}
