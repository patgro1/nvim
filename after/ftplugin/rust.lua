local wk = require("which-key")
local bufnr = vim.api.nvim_get_current_buf()
wk.add({
    {
        "<leader>la",
        function()
            vim.cmd.RustLsp("codeAction")
        end,
        desc = "LSP Code Action",
        mode = "n",
    },
})
