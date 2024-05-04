return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup({
        defaults = {
          preview = false,
          prompt_prefix = '',
          entry_prefix = ' ',
          selection_caret = ' ',
          sorting_strategy = 'ascending',
          layout_strategy = 'vertical',
          layout_config = {
            prompt_position = 'top',
            width = 0.6,
            height = 0.5,
          },
        }
      })

      -- telescope.load_extension('grey')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
    end
  }
}
