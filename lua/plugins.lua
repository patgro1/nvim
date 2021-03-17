-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local use = require('packer').use
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim'}

  use {'kyazdani42/nvim-tree.lua'}

  -- Icons
  use {'kyazdani42/nvim-web-devicons'}

  -- Buffer bar and status line
  use {'romgrk/barbar.nvim'}
  use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      -- your statusline
      config = function() require'my_statusline' end,
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Git
  use {'TimUntersberger/neogit'}

  -- Colorscheme
  --use {'Th3Whit3Wolf/one-nvim'}
  use {'ChristianChiarulli/nvcode-color-schemes.vim'}

  -- Fast colorizer to preview hex colors
  use {'norcalli/nvim-colorizer.lua'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- We recommend updating the parsers on update
  use {'p00f/nvim-ts-rainbow'}

  -- LSP
  use {'neovim/nvim-lspconfig'}

  -- Telescope
  use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}

  -- Auto completion
  use {'hrsh7th/nvim-compe'}
end)
