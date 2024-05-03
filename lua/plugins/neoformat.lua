return {
  {
    'sbdchd/neoformat',
    config = function()
      -- dotnet tool install --global csharpier
      vim.g.neoformat_enabled_cs = { 'csharpier' }

      vim.g.neoformat_enabled_astro = { 'prettier' }
      vim.g.neoformat_try_node_exe = 1

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function()
          vim.cmd('Neoformat')
        end
      })
    end
  }
}
