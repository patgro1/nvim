local opts = { noremap = true, silent = true }

-- Clear the last search
vim.keymap.set('n', '<leader>,', '<cmd>nohl<CR>')

-- Swap lines
vim.keymap.set('n', '<leader>j', '<cmd>m .+1<CR>==')
vim.keymap.set('n', '<leader>k', '<cmd>m .-2<CR>==')


-- Make Y act like C or D
vim.keymap.set('n', 'Y', 'y$')

-- Recenter the screen when moving around
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zzzv')
vim.keymap.set('n', '<C-u>', '<C-u>zzzv')

-- Undo breakpoints
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')
vim.keymap.set('i', '<CR>', '<CR><c-g>u')

--vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>')
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>')
vim.keymap.set('n', '<leader>bk', '<cmd>bprevious<bar> bd#<CR>')
vim.keymap.set('n', '<leader>bo', '<cmd>:w <bar> %bd <bar> e# <bar> bd#<CR>')


-- Able to navigate with ctrl
vim.keymap.set('n', '<C-h>', '<Cmd>wincmd h<CR>')
vim.keymap.set('n', '<C-j>', '<Cmd>wincmd j<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>wincmd k<CR>')
vim.keymap.set('n', '<C-l>', '<Cmd>wincmd l<CR>')


-- Quickfix open, close, next, previous
vim.keymap.set("n", "<leader>co", "<Cmd>copen<CR>")
vim.keymap.set("n", "<leader>cc", "<Cmd>cclose<CR>")
vim.keymap.set("n", "<leader>cn", "<Cmd>cnext<CR>")
vim.keymap.set("n", "<leader>cp", "<Cmd>cprevious<CR>")
