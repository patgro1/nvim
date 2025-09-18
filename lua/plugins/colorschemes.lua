return {
    {
        "https://github.com/sainnhe/gruvbox-material",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[let g:gruvbox_material_background = 'soft']])
            -- vim.cmd([[colorscheme gruvbox-material]])
        end
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[colorscheme carbonfox]])
        end
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                -- Your config here
            })
        end,
    }
}
