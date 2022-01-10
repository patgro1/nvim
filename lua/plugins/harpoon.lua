local wk = require('which-key')
require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
    },

    wk.register({
        h = {
            name = "Harpoon",
            c = { '<Cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', 'Menu'},
            a = { '<Cmd>lua require("harpoon.mark").add_file()<CR>', 'Add file'},
            s = { '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', 'Goto file 1'},
            d = { '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', 'Goto file 2'},
            f = { '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', 'Goto file 3'},
            g = { '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', 'Goto file 4'}
        }
    }, {prefix = "<leader>"})


--[[ -- Harpoon
map('n', '<C-e>', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<leader>hc', '<Cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)
map('n', '<leader>a', '<Cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<C-s>', '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
-- FIXME: change C-d binding please...
map('n', '<C-d>', '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<C-f>', '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<C-g>', '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts) ]]
})
