return {
  {
    'SirVer/ultisnips',
    dependencies = {
      'honza/vim-snippets'
    },
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<Tab>'
      vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
    end
  }
}
