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

-- Nvimtree
vim.keymap.set('n', '<leader>et', '<Cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>')

-- Telescope accessors
vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>ff', require"pat.telescope".find_files)
vim.keymap.set('n', '<leader>fg', '<Cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader> ', '<Cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader>fh', require"telescope.builtin".oldfiles)
vim.keymap.set('n', '<leader>fp', require"pat.telescope".get_vim_config)
vim.keymap.set('n', '<leader>fd', require"pat.telescope".get_dot_files)
vim.keymap.set('n', '<leader>hh', '<Cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>ii', '<Cmd>Telescope symbols<cr>')
vim.keymap.set('n', '<leader>ss', ':lua require\'telescope.builtin\'.grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true }<CR>')
vim.keymap.set('n', '<leader>gs', ':lua require\'telescope.builtin\'.grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = \'\' }<CR>')
