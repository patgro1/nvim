local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Treesiter is a incremental parser to improve syntax highlighting and such
    use "nvim-treesitter/nvim-treesitter"
    -- LSP
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

    -- Lines
    use "kyazdani42/nvim-web-devicons" -- This is a dependency of barbar
    use "romgrk/barbar.nvim"

    -- Helper for coding
    use "p00f/nvim-ts-rainbow"

    vim.cmd [[packadd nvcode-color-schemes.vim]]
end)
