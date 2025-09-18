return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
    { "echasnovski/mini.align", version = "*", config = true, event = "BufReadPre" },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            local align = require('mini.align')
            align.setup({
                step = {
                    pre_justify = { align.gen_step.filter('n == 1') }
                }
            })
        end,
    },
}
