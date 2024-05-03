return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag'
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'astro',
          'lua',
          'c',
          'rust',
          'javascript',
          'html',
          'vue',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        autotag = { enable = true },
        additional_vim_regex_highlighting = false,
      })
    end
  }
}
