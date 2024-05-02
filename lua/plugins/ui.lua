return {
  {
    'yorickpeterse/nvim-grey',
    config = function()
      vim.o.termguicolors = true
      vim.cmd('colorscheme grey')
    end
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
  }
}
