-- Boostraping packer. Need to run this *BEFORE* packer is ran
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

require('plugins')
require('settings')
require('colorscheme')
require('mappings')

require('pg_compe')
require('pg-treesitter')
require('pg-colorizer')
require('pg-neogit')
require('lsp.lua-ls')
