return {
    {
        "xiyaowong/transparent.nvim",
        cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" }
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
    },
    {
        "https://github.com/sainnhe/gruvbox-material",
        config = function()
            vim.cmd([[let g:gruvbox_material_background = 'soft']])
            vim.cmd([[colorscheme gruvbox-material]])
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            -- vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    }
}
