return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 40,
          side = 'right',
        },
        renderer = {
          group_empty = true,
          indent_width = 1,
        },
        filters = {
          dotfiles = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
        }
      })

      vim.keymap.set('n', '<leader>x', '<Cmd>NvimTreeToggle<CR>', {})
    end
  }
}
