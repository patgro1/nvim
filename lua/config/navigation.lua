require("which-key").add({
    mode = { "n" },
    {
        "<leader>b",
        group = "buffer",
    },
    {
        "<leader>bp",
        "<cmd>BufferPrevious<cr>",
        desc = "Move to previous buffer",
    },
    {
        "<leader>bn",
        "<cmd>BufferNext<cr>",
        desc = "Move to next buffer",
    },
})
