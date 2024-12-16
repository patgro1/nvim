return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                version = "2.x",
                opts = {
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
                },
            },
        },
        cmd = { "Neotree" },
        keys = {
            {
                "<leader>fee",
                function()
                    require("neo-tree.command").execute({ toggle = true })
                end,
                desc = "Open file explorer",
            },
            {
                "<leader>feb",
                function()
                    require("neo-tree.command").execute({ source = "buffers", toggle = true })
                end,
                desc = "Open file explorer with filtered on opened buffers",
            },
            {
                "<leader>feg",
                function()
                    require("neo-tree.command").execute({ source = "git_status", toggle = true })
                end,
                desc = "Open file explorer filtered on git status",
            },
        },
        opts = {
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
        },
    },
    {
        "echasnovski/mini.files",
        version = "*",
        keys = {
            {
                "<leader>me",
                function()
                    require("mini.files").open()
                end,
            },
        },
        config = true,
    },
}
