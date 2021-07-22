-- Searching for file and keywords
vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>lua require"core.telescope".find_files()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader> ', '<Cmd>Telescope git_files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<Cmd>Telescope git_files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<Cmd>lua require"telescope.builtin".oldfiles()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fc', '<Cmd>lua require"core.telescope".get_vim_config()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fc', '<Cmd>lua require"core.telescope".get_vim_config()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fc', '<Cmd>lua require"core.telescope".get_vim_config()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>ss', '<Cmd>Telescope grep_string<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>sg', '<Cmd>Telescope live_grep<CR>', {noremap=true})

-- Buffer manipulation
vim.api.nvim_set_keymap('n', '<leader>bb', '<Cmd>Telescope buffers<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bn', '<Cmd>BufferNext<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bp', '<Cmd>BufferPrevious<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bk', '<Cmd>BufferDelete<CR>', {noremap=true})

-- Git
vim.api.nvim_set_keymap('n', '<leader>gst', '<Cmd>Gstatus<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gn', '<Cmd>lua require"gitsigns".next_hunk()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gp', '<Cmd>lua require"gitsigns".previous_hunk()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gs', '<Cmd>lua require"gitsigns".stage_hunk()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gS', '<Cmd>lua require"gitsigns".stage_buffer()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gr', '<Cmd>lua require"gitsigns".reset_hunk()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gR', '<Cmd>lua require"gitsigns".reset_buffer()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gb', '<Cmd>lua require"gitsigns".blame_line(true)<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>gbt', '<Cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', {noremap=true})

-- Misc
vim.api.nvim_set_keymap('n', '<leader>tc', '<Cmd>lua require"telescope.builtin".colorscheme()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', {noremap=true})
