return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                version = "1.x",
                config = function()
                    require("window-picker").setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            bo = {
                                -- Ignore these filetype for window selection
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },

                                -- ignore there buftype for window selection
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                        other_win_hl_color = "#e35e4f",
                    })
                end,
            },
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["<CR>"] = "open_with_window_picker",
                        ["s"] = "split_with_window_picker",
                        ["S"] = "vsplit_with_window_picker",
                    },
                },
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute({ toggle = true })
                end,
                desc = "File explorer",
            },
        },
    },
    {
        --local harpoon = require("harpoon")
        --
        ---- REQUIRED
        --harpoon:setup()
        ---- REQUIRED
        --
        --vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        --vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        --
        --vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        --vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        --vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        --vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
        --
        ---- Toggle previous & next buffers stored within Harpoon list
        --vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        --vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require "harpoon":setup()
        end,
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon"):list():append()
                end,
                desc = "Add file to harpoon"
            },
            {
                "<C-e>",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Open harpoon menu"
            },
            {
                "<C-1>",
                function()
                    require("harpoon"):list():select(1)
                end,
                desc = "Select first harppon entry"
            },
            {
                "<C-2>",
                function()
                    require("harpoon"):list():select(2)
                end,
                desc = "Select second harppon entry"
            },
            {
                "<C-3>",
                function()
                    require("harpoon"):list():select(3)
                end,
                desc = "Select third harppon entry"
            },
            {
                "<C-4>",
                function()
                    require("harpoon"):list():select(4)
                end,
                desc = "Select fourth harppon entry"
            },
            {
                "<C-S-P>",
                function()
                    require("harpoon"):list():prev()
                end,
                desc = "Select previous harpoon entry"
            },
            {
                "<C-S-N>",
                function()
                    require("harpoon"):list():next()
                end,
                desc = "Select next harpoon entry"
            },
        }
    },
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            nvim_tmux_nav.setup {}
            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    }
}
