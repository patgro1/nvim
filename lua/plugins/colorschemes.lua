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
            -- vim.cmd([[colorscheme carbonfox]])
        end
    },
    {
        "oxfist/night-owl.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require("night-owl").setup()
            vim.cmd([[colorscheme night-owl]])
        end,
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
