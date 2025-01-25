require("which-key").add({
    mode = { "n" },
    {
        "<leader>b",
        group = "buffer",
    },
    {
        "<leader>bp",
        "<cmd>bprev<cr>",
        desc = "Move to previous buffer",
    },
    {
        "<leader>bn",
        "<cmd>bnext<cr>",
        desc = "Move to next buffer",
    },
})
