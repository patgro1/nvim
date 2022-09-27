local fn = vim.fn
local ensure_packer = function()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Faster vim startup
    use 'lewis6991/impatient.nvim'

    -- Color scheme
    use {
            "EdenEast/nightfox.nvim",
            config = function()
                require("pat.theme")
            end
        }

    -- File Explorer
    use 'kyazdani42/nvim-web-devicons'
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = {"NvimTreeToggle", "NvimTreeOpen"},
        config = function()
            require "pat.nvimtree"
        end
    }

    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require "pat.telescope"
        end
    }
    use {
        "nvim-telescope/telescope-fzy-native.nvim",
        run = "make",
    }

    -- Treesitter and utilities
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require "pat.treesitter"
        end,
        run = ":TSUpdate"
    }
    use "p00f/nvim-ts-rainbow"


    -- Auto complete
    use "onsails/lspkind-nvim"
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require "pat.cmp"
        end
    }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'

    -- LSP
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig'
    }

    use "sindrets/diffview.nvim"

    use "lukas-reineke/indent-blankline.nvim"

    -- Automatically set up configuration after clone packer
    -- Put this at the end of all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
