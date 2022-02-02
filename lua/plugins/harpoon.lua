require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
    },

    vim.keymap.set('n', '<leader>hc', require("harpoon.ui").toggle_quick_menu),
    vim.keymap.set('n', '<leader>ha', require("harpoon.mark").add_file),
    vim.keymap.set('n', '<leader>hs', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>'),
    vim.keymap.set('n', '<leader>hd', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>'),
    vim.keymap.set('n', '<leader>hf', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>'),
    vim.keymap.set('n', '<leader>hg', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>'),
})
