require("whichkey_setup").config{
    hide_statusline = false,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}

local wk = require('whichkey_setup')

local keymap = {
    f = {
        name = '+find',
        f = {'<Cmd>Telescope find_files<CR>', 'Files'},
        g = {'<Cmd>Telescope git_files<CR>', 'Project'},
        s = {
            name = 'grep',
            s = {'<Cmd>Telescope grep_string<CR>', 'Grep String'},
            g = {'<Cmd>Telescope live_grep<CR>', 'Live Grep'},
        },
    },
    b = {
        name = '+buffers',
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        n = {'<Cmd>BufferNext<CR>', 'next'},
        o = {'<Cmd>BufferCloseAllButCurrent<CR>', 'Kill other buffers'},
        p = {'<Cmd>BufferPrevious<CR>', 'next'},
        k = {'<Cmd>BufferDelete<CR>', 'kill'}
    },
    g = {
        name = '+git',
        n = {'<Cmd>lua require"gitsigns".next_hunk()<CR>', 'Next hunk'},
        p = {'<Cmd>lua require"gitsigns".next_hunk()<CR>', 'Previous hunk'},
        s = {'<Cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage hunk'},
        S = {'<Cmd>lua require"gitsigns".stage_buffer()<CR>', 'Stage buffer'},
        u = {'<Cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'Undo stage hunk'},
        r = {'<Cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset hunk'},
        R = {'<Cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset buffer'},
        b = {
            l = {'<Cmd>lua require"gitsigns".blame_line(true)<CR>', 'Line git blame'},
            -- TODO: this does not work for some reason....
            t = {'<Cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', 'Toggle line git blame'},
        }
    }
}

wk.register_keymap('leader', keymap)
