vim.o.number = true

-- Identation
vim.o.expandtab   = true
vim.o.shiftround  = true
vim.o.tabstop     = 2
vim.o.softtabstop = 2
vim.o.shiftwidth  = 2

-- Listchars
vim.o.list      = true
vim.o.listchars = 'tab:>-,eol:$,trail:.'

-- Status bar
vim.o.laststatus = 3

-- Splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- Sign
vim.o.signcolumn = 'yes'

-- Configure Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODOs
-- Some LSP things:
--   - fidget
--   - lspsaga

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup("plugins")
