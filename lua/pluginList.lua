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
        use {
            "wbthomason/packer.nvim",
            event = "VimEnter"
        }
        use {
            "marko-cerovac/material.nvim",
            after = "packer.nvim",
        }
        use {
            "EdenEast/nightfox.nvim",
            after = "material.nvim",
            config = function()
                require("theme")
            end
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = function()
                require "plugins.indent-blankline"
            end
        }
        use {
            "kyazdani42/nvim-web-devicons",
            after = "nightfox.nvim"
        }
        -- Status bar and buffer line
        use {
            "romgrk/barbar.nvim",
            after = "nvim-web-devicons"
        }
        use {
            "NTBBloodbath/galaxyline.nvim",
            after = "nvim-web-devicons",
            config = function()
                require "plugins.galaxyline"
            end
        }
        -- Helper for coding
        use {
            "p00f/nvim-ts-rainbow",
            after = "nvim-treesitter"
        }

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
            event = "BufRead",
            config = function()
                require "plugins.lspconfig"
            end
        }
        use {
            'williamboman/nvim-lsp-installer',
            after = 'nvim-lspconfig'
        }

        use {
            'nvim-lua/lsp-status.nvim',
            after = 'nvim-lspconfig'
        }
        use {
            "onsails/lspkind-nvim",
        }
        use {
            'hrsh7th/cmp-buffer',
            after = 'nvim-cmp'
        }
        use {
            'hrsh7th/cmp-nvim-lua',
            after = 'nvim-cmp'
        }
        use {
            'hrsh7th/cmp-nvim-lsp',
            after = 'nvim-cmp'
        }
        use {
            "hrsh7th/nvim-cmp",
            config = function()
                require "plugins.cmp"
            end
        }

        use {
            "nvim-lua/plenary.nvim",
            event = "VimEnter",
        }
        use {
            "nvim-lua/popup.nvim",
            after = "plenary.nvim"
        }
        use {
            "nvim-telescope/telescope-fzy-native.nvim",
            after = "popup.nvim",
            run = "make",
            --cmd = "Telescope"
        }
        use {
            'nvim-telescope/telescope.nvim',
            after = "telescope-fzy-native.nvim",
            config = function()
                require "plugins.telescope"
            end
        }
        use {
            'ThePrimeagen/harpoon',
            after = 'plenary.nvim',
            config = function()
                require 'plugins.harpoon'
            end
        }
        -- Orgmode
        use {
            "kristijanhusak/orgmode.nvim",
            event = "BufRead",
            config = function()
                require 'plugins.orgmode'
            end
        }
        -- Neorg... ORG mode on steroid
        use {
            "vhyrro/neorg",
            after = "plenary.nvim",
            config = function()
                require 'plugins.neorg'
            end
        }
        use {
            "dhruvasagar/vim-table-mode"
        }

        use {
            "b3nj5m1n/kommentary",
            after = "nightfox.nvim",
        }
        -- todo highlighter that is really awesome
        use {
            "folke/todo-comments.nvim",
            after = "nightfox.nvim",
            config = function()
                require 'plugins.todo-highlighter'
            end
        }


        use {
            'norcalli/nvim-colorizer.lua',
            event = "BufRead"
        }

        -- Git
        use {
            'lewis6991/gitsigns.nvim',
            after = "plenary.nvim",
            config = function()
                require "plugins.gitsigns"
            end
        }
        use {
            "ThePrimeagen/git-worktree.nvim",
            after = "telescope.nvim",
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

        use {
            "sindrets/diffview.nvim",
            after = "neogit"
        }

        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end,
            --after = "packer.nvim"
        }
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
