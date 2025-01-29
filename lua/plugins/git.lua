return {
    {
        "echasnovski/mini-git",
        version = "*",
        main = "mini.git",
        config = true,
    },
    {
        "echasnovski/mini.diff",
        version = "*",
        config = true,
    },
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
        },
    },
    {
        "sindrets/diffview.nvim", -- optional - Diff integration
        config = true,
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    },
}
