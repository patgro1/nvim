return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true,
        keys = {
            { "<leader>g", group = "git" },
            {
                "<leader>gg",
                function()
                    require("neogit").open()
                end,
                desc = "Open neogit",
            },
            {
                "<leader>gl",
                function()
                    require("config.lazygit").open_lazygit_file_log()
                end,
                desc = "Lazygit file log",
            },
            {
                "<leader>gL",
                function()
                    require("config.lazygit").open_lazygit()
                end,
                desc = "Lazygit",
            },
        },
    },
    {
        "sindrets/diffview.nvim", -- optional - Diff integration
        config = true,
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    },
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        config = true,
    },
}
