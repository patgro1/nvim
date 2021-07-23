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
            config = function()
                require("theme")
            end
        }
        use {
            "kyazdani42/nvim-web-devicons",
            after = "material.nvim"
        }
        -- Status bar and buffer line
        use {
            "romgrk/barbar.nvim",
            after = "nvim-web-devicons"
        }
        use {
            "glepnir/galaxyline.nvim",
            after = "nvim-web-devicons",
            config = function()
                require "plugins.galaxyline"
            end
        }
        -- Helper for coding
        use {
            "p00f/nvim-ts-rainbow",
            after = "material.nvim"
        }

        -- File Explorer
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
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
            event = "BufRead",
            config = function()
                require "plugins.treesitter"
            end,
            run = ":TSUpdate"
        }

        -- LSP
        use {
            "kabouzeid/nvim-lspinstall",
            event = "BufRead"
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function()
                require "plugins.lspconfig"
            end
        }
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require "plugins.compe"
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
            'nvim-telescope/telescope.nvim',
            --cmd = "Telescope",
            after = "telescope-fzy-native.nvim",
            config = function()
                require "plugins.telescope"
            end
        }
        use {
            "nvim-telescope/telescope-fzy-native.nvim",
            run = "make",
            cmd = "Telescope"
        }
        -- Orgmode
        use {
            "kristijanhusak/orgmode.nvim",
            event = "BufRead",
            config = function()
                require 'plugins.orgmode'
            end
        }

        -- todo highlighter that is really awesome
        use {
            "folke/todo-comments.nvim",
            after = "material.nvim",
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
            after = "plenary.nvim",
            config = function()
            end
        }
        use {
            "tpope/vim-fugitive",
            after = "plenary.nvim"
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
