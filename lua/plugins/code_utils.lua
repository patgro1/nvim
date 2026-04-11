return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    { "echasnovski/mini.align", version = "*", config = true, event = "BufReadPre" },
}
