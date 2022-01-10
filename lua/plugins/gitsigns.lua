local wk = require("which-key")
require('gitsigns').setup {
 keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
  },
  current_line_blame = true
}

wk.register({
    g = {
        name = "Git",
        g = { '<Cmd>Neogit<CR>', 'Git buffer'},
        n = { '<Cmd>lua require"gitsigns".next_hunk()<CR>', 'Next hunk'},
        p = { '<Cmd>lua require"gitsigns".next_hunk()<CR>', 'Previous hunk'},
        s = {
            name = "Stage",
            h = { '<Cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage hunk'},
            b = { '<Cmd>lua require"gitsigns".stage_buffer()<CR>', 'Stage buffer'},
        },
        r = {
            name = "Reset",
            h = { '<Cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset hunk'},
            b = { '<Cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset buffer'},
        },
        b = {
            name = "blame",
            l = { '<Cmd>lua require"gitsigns".blame_line(true)<CR>', 'Line'},
            t = { '<Cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', 'Toggle'}
        },
        p = {
            name = 'Push',
            p = {'<Cmd>!git push<CR>', 'Push to remote'}
        }
    }
}, {prefix = "<leader>"})
