local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local wk = require("which-key")

local opts = {}
local cmd = vim.cmd


-- Base shortcuts from leader
--[[ map('n', '<leader>j', ":m .+1<CR>==", {noremap = true})
map('n', '<leader>k', ":m .-2<CR>==", {noremap = true}) ]]
wk.register({
   [','] = {'<Cmd>nohl<CR>', 'Clear search highlight'},
   j = {":m .+1<CR>==", "Swap line with one below"},
   k = {":m .-2<CR>==", "Swap line with one over"},
   -- ['<spc>'] = { '<Cmd>Telescope git_files<CR>', "Find file (project)"}
}, {prefix = '<leader>'})


-- Remove trailling whitespace
cmd([[autocmd BufWritePre * %s/\s\+$//e]])
cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

-- Make Y act like C or D
map('n', 'Y', 'y$', {noremap = true})
-- Make sure we recenter the screen when jumping to next/previous find
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})
-- When joining lines, keep the cursor at the same place
map('n', 'J', 'mzJ`z', {noremap = true})
-- Undo breakpoints
map('i', ',', ',<c-g>u', {noremap = true})
map('i', '.', '.<c-g>u', {noremap = true})
map('i', '!', '!<c-g>u', {noremap = true})
map('i', '?', '?<c-g>u', {noremap = true})
map('i', '<CR>', '<CR><c-g>u', {noremap = true})
-- Move text around
map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
map('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
map('i', '<C-j>', "<esc>:m .+1<CR>==i", {noremap = true})
map('i', '<C-k>', "<esc>:m .-2<CR>==i", {noremap = true})

-- Buffers
wk.register({
    b = {
        name = "Buffer",
        b = {'<Cmd>Telescope buffers<CR>', 'Switch buffer'},
        n = {'<Cmd>BufferNext<CR>', 'Next Buffer'},
        p = {'<Cmd>BufferPrevious<CR>', 'Previous Buffer'},
        o = {'<Cmd>BufferCloseAllButCurrent<CR>', 'Kill other buffers'},
        k = {'<Cmd>BufferDelete<CR>', 'Kill current buffer'}
    }
}, {prefix = "<leader>"})

map('n', '<tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<s-tab>', '<Cmd>BufferPrevious<CR>', opts)

wk.register({
    f = {
        name = "Files",
        f = { '<Cmd>lua require"plugins.telescope".find_files()<CR>', "Find file"},
        g = { '<Cmd>Telescope git_files<CR>', "Find file (project)"},
        ["spc"] = { '<Cmd>Telescope git_files<CR>', "Find file (project)"},
        h = { '<Cmd>lua require"telescope.builtin".oldfiles()<CR>', "File history"},
        p = { '<Cmd>lua require"plugins.telescope".get_vim_config()<CR>', "Find file in config"}
    }
}, {prefix = "<leader>"})

wk.register({
    s = {
        name = "Grep",
        s = { '<Cmd>Telescope grep_string<CR>', 'String'},
        g = { '<Cmd>Telescope live_grep<CR>', 'Live Grep'},
    }
}, {prefix = "<leader>"})

-- Misc
map('n', '<leader>tc', '<Cmd>lua require"telescope.builtin".colorscheme()<CR>', opts)
map('n', '<leader>et', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>', opts)
map('n', '<leader>tm', '<Cmd>TableModeToggle<CR>', opts)

-- Split navigation
map('n', '<C-h>', '<Cmd>wincmd h<CR>', opts)
map('n', '<C-j>', '<Cmd>wincmd j<CR>', opts)
map('n', '<C-k>', '<Cmd>wincmd k<CR>', opts)
map('n', '<C-l>', '<Cmd>wincmd l<CR>', opts)

-- Hop
map('n', '<Leader>ww', '<Cmd>HopWord<CR>', opts)
map('n', '<Leader>ll', '<Cmd>HopLine<CR>', opts)
