local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = {}
local cmd = vim.cmd

vim.keymap.set('n', '<leader>,', '<cmd>nohl')
vim.keymap.set('n', '<leader>j', '<cmd>m .+1<CR>==')
vim.keymap.set('n', '<leader>k', '<cmd>m .-2<CR>==')


-- Remove trailling whitespace
-- TODO: maybe this could be per file type though...
cmd([[autocmd BufWritePre * %s/\s\+$//e]])
cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

-- Make Y act like C or D
-- # TODO: use the new keymap api
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
vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>bn', '<cmd>BufferNext<CR>')
vim.keymap.set('n', '<leader>bp', '<cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<leader>bo', '<cmd>BufferCloseAllButCurrent<CR>')
vim.keymap.set('n', '<leader>bk', '<cmd>BufferDelete<CR>')

-- TODO: use new api
map('n', '<tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<s-tab>', '<Cmd>BufferPrevious<CR>', opts)

vim.keymap.set('n', '<leader>ff', require"plugins.telescope".find_files)
vim.keymap.set('n', '<leader>fg', '<Cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader> ', '<Cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader>fh', require"telescope.builtin".oldfiles)
vim.keymap.set('n', '<leader>fp', require"plugins.telescope".get_vim_config)

vim.keymap.set('n', '<leader>ss', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep<cr>')
-- Search keymaps
vim.keymap.set('n', '<leader>sk', require"telescope.builtin".keymaps)

-- Misc
-- TODO: use new api
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
