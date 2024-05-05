return {
  {
    'yorickpeterse/nvim-grey',
    config = function()
      vim.o.termguicolors = true
      -- vim.cmd('colorscheme grey')
    end
  },
  {
    'projekt0n/github-nvim-theme',
    config = function()
      vim.o.termguicolors = true
      -- vim.cmd('colorscheme github_dark_dimmed')
    end
  },
  {
    'marko-cerovac/material.nvim',
    config = function()
      vim.o.termguicolors = true
      vim.cmd('colorscheme material-darker')
    end
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
  },
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          diagnostics = 'nvim_lsp',
        },
      })

      vim.keymap.set('n', ']b', '<Cmd>BufferLineCycleNext<CR>', {})
      vim.keymap.set('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', {})
    end
  },
}
