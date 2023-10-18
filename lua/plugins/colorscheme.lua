return {
    "EdenEast/nightfox.nvim",
    {
        "xiyaowong/transparent.nvim",
        cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" }
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        config = function()
            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = true,
                italic = true,
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,    -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    }
}
