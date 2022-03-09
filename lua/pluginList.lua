local present, _ = pcall(require, "packerInit")
local packer

if present then
    packer = require "packer"
else
    return false
end


local use = packer.use

return packer.startup({
    function()
        use "wbthomason/packer.nvim"
        use "dstein64/vim-startuptime"
        use "lewis6991/impatient.nvim"
        use "marko-cerovac/material.nvim"
        use {
            "EdenEast/nightfox.nvim",
            config = function()
                require("theme")
            end
        }
        use "https://github.com/shaunsingh/nord.nvim.git"
        use 'Mofiqul/dracula.nvim'
        use 'bluz71/vim-nightfly-guicolors'
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require "plugins.indent-blankline"
            end
        }
        use "kyazdani42/nvim-web-devicons"

        -- Status bar and buffer line
        use "romgrk/barbar.nvim"

        use {
            "NTBBloodbath/galaxyline.nvim",
            config = function()
                require "plugins.galaxyline"
            end
        }

        -- Helper for coding
        use "p00f/nvim-ts-rainbow"

        -- File Explorer
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = {"NvimTreeToggle", "NvimTreeOpen"},
            config = function()
                require "plugins.nvimtree"
            end
        }

        -- Hop line to increase navigation speed
        use {
            "phaazon/hop.nvim",
            as = "hop",
            cmd = {
                "HopWord",
                "HopLine",
                "HopChar1",
                "HopChar2",
                "HopPattern"
            },
            config = function()
                require'hop'.setup()
            end
        }

        -- Treesitter
        -- TODO: Need to check when to load up. If calling
        -- nvim init.lua, treesiter is not loaded before the buffer
        -- is shown thus there is not syntax highlighting.
        use {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require "plugins.treesitter"
            end,
            run = ":TSUpdate"
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig",
        }
        use {
            'williamboman/nvim-lsp-installer',
            config = function()
                require "plugins.lspconfig"
            end
        }

        use 'nvim-lua/lsp-status.nvim'
        use "onsails/lspkind-nvim"

        -- Autocomplete
        use {
            "hrsh7th/nvim-cmp",
            config = function()
                require "plugins.cmp"
            end
        }
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-omni'
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/cmp-nvim-lsp'

        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"
        use {
            "nvim-telescope/telescope-fzy-native.nvim",
            run = "make",
        }
        use {
            'nvim-telescope/telescope.nvim',
            config = function()
                require "plugins.telescope"
            end
        }
        use {
            'ThePrimeagen/harpoon',
            config = function()
                require 'plugins.harpoon'
            end
        }

        -- Orgmode
        use {
            "kristijanhusak/orgmode.nvim",
            config = function()
                require 'plugins.orgmode'
            end
        }
        --[[ -- Neorg... ORG mode on steroid
        use {
            "vhyrro/neorg",
            config = function()
                require 'plugins.neorg'
            end
        } ]]
        use "dhruvasagar/vim-table-mode"

        use {
            "numToStr/Comment.nvim",
            config = function()
                require 'plugins.comments'
            end
        }

        -- todo highlighter that is really awesome
        use {
            "folke/todo-comments.nvim",
            config = function()
                require 'plugins.todo-highlighter'
            end
        }

        use 'norcalli/nvim-colorizer.lua'

        -- Git
        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require "plugins.gitsigns"
            end
        }
        use {
            "ThePrimeagen/git-worktree.nvim",
            config = function()
                require 'plugins.git-worktree'
            end
        }
        use {
            "TimUntersberger/neogit",
            cmd = "Neogit",
            config = function()
                require 'plugins.neogit'
            end
        }

        use "sindrets/diffview.nvim"

    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float {border = "single"}
            end
        },
        git = {
            clone_timeout = 600
        }
    },
})
