return {
  {
    'sbdchd/neoformat',
    config = function()
      -- dotnet tool install --global csharpier
      vim.g.neoformat_enabled_cs = { 'csharpier' }

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function()
          vim.cmd('Neoformat')
        end
      })
    end
  }
}
