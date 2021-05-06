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
}

wk.register_keymap('leader', keymap)
