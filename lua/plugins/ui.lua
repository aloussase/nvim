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
      vim.cmd('colorscheme github_dark_dimmed')
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
}
