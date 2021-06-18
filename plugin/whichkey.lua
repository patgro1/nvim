require("whichkey_setup").config{
    hide_statusline = false,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}
require('patgro')

local wk = require('whichkey_setup')

local keymap = {
    f = {
        name = '+find',
        b = {'<Cmd>lua require"telescope.builtin".marks()<CR>', "History"},
        f = {'<Cmd>Telescope find_files<CR>', 'Files'},
        g = {'<Cmd>Telescope git_files<CR>', 'Project'},
        h = {'<Cmd>lua require"telescope.builtin".oldfiles()<CR>', "History"},
        c = {'<Cmd>lua require"patgro.telescope".get_vim_config()<CR>', "Vim Config"},
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
        fs = {'<Cmd>Gstatus<CR>', 'Git status'},
        n = {'<Cmd>lua require"gitsigns".next_hunk()<CR>', 'Next hunk'},
        p = {'<Cmd>lua require"gitsigns".next_hunk()<CR>', 'Previous hunk'},
        s = {'<Cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage hunk'},
        S = {'<Cmd>lua require"gitsigns".stage_buffer()<CR>', 'Stage buffer'},
        u = {'<Cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'Undo stage hunk'},
        r = {'<Cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset hunk'},
        R = {'<Cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset buffer'},
        b = {
            l = {'<Cmd>lua require"gitsigns".blame_line(true)<CR>', 'Line git blame'},
            t = {'<Cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', 'Toggle line git blame'},
        },
    },
    l = {
        name = '+lsp',
        g = {
            name = '+goto',
            d = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'Goto definition'},
            D = {'<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto declaration'},
            r = {'<Cmd>lua vim.lsp.buf.references()<CR>', 'Find references'},
            i = {'<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto implementation'},
        },
        c = {
            name = '+code',
            c = {'<Cmd>Lspsaga code_action<CR>', 'Code action'},
            r = {'<Cmd>Lspsaga rename<CR>', 'Rename'},
        },
        h = {'<Cmd>Lspsaga hover_doc<CR>', 'Get hover doc'},
        f = {'<Cmd>Lspsaga lsp_finder<CR>', 'Find reference and def'},
        pd = {'<Cmd>Lspsaga preview_definition<CR>', 'Preview definition'},
        -- d = {
        -- --    name = '+diagnostics',
        -- --    c = {'<Cmd>Lspsaga show_line_diagnostic<CR>', 'Show line diagnostic'},
        -- },
    },
    p = {
        name = '+project',
        t = {'<Cmd>TodoTelescope<CR>', 'List all project todos'}
    },
    s = {
        name = '+session',
        s = {'<Cmd>SessionSave<CR>', 'Save'},
        l = {'<Cmd>SessionLoad<CR>', 'Load'}
    },
    t = {
        name = '+misc',
        c = {'<Cmd>lua require"telescope.builtin".colorscheme()<CR>', "Change Colorscheme"},
        t = {'<Cmd>NvimTreeToggle<CR>', 'Toggle Nvim Tree'},
        r = {'<Cmd>NvimTreeRefresh<CR>', 'Refresh Nvim Tree'}

    }
}

wk.register_keymap('leader', keymap)
