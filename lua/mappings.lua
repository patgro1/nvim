local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = {}
local cmd = vim.cmd


-- Remove search highlighting
map('n', '<leader>,', '<Cmd>nohl<CR>', opts)

-- Remove trailling whitespace
cmd([[autocmd BufWritePre * %s/\s\+$//e]])
cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

-- Buffers
map('n', '<leader>bb', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<leader>bn', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>bp', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
map('n', '<leader>bk', '<Cmd>BufferDelete<CR>', opts)

-- Telescope
-- FIXME: the custom function wont work since telescope is not loaded at first...
map('n', '<leader>ff', '<Cmd>lua require"plugins.telescope".find_files()<CR>', opts)
map('n', '<leader> ', '<Cmd>Telescope git_files<CR>', opts)
map('n', '<leader>fg', '<Cmd>Telescope git_files<CR>', opts)
map('n', '<leader>fh', '<Cmd>lua require"telescope.builtin".oldfiles()<CR>', opts)
map('n', '<leader>fc', '<Cmd>lua require"plugins.telescope".get_vim_config()<CR>', opts)
map('n', '<leader>ss', '<Cmd>Telescope grep_string<CR>', opts)
map('n', '<leader>sg', '<Cmd>Telescope live_grep<CR>', opts)

-- Git
--
map('n', '<leader>gst', '<Cmd>Gstatus<CR>', opts)
map('n', '<leader>gn', '<Cmd>lua require"gitsigns".next_hunk()<CR>', opts)
map('n', '<leader>gp', '<Cmd>lua require"gitsigns".previous_hunk()<CR>', opts)
map('n', '<leader>gs', '<Cmd>lua require"gitsigns".stage_hunk()<CR>', opts)
map('n', '<leader>gS', '<Cmd>lua require"gitsigns".stage_buffer()<CR>', opts)
map('n', '<leader>gr', '<Cmd>lua require"gitsigns".reset_hunk()<CR>', opts)
map('n', '<leader>gR', '<Cmd>lua require"gitsigns".reset_buffer()<CR>', opts)
map('n', '<leader>gbl', '<Cmd>lua require"gitsigns".blame_line(true)<CR>', opts)
map('n', '<leader>gbt', '<Cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', opts)
-- Git worktrees
-- FIXME: the custom function wont work since telescope is not loaded at first...
map('n', '<leader>gww', '<Cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', opts)
map('n', '<leader>gcw', '<Cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', opts)
-- Misc
map('n', '<leader>tc', '<Cmd>lua require"telescope.builtin".colorscheme()<CR>', opts)
map('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', opts)

-- Split navigation
map('n', '<C-h>', '<Cmd>wincmd h<CR>', opts)
map('n', '<C-j>', '<Cmd>wincmd j<CR>', opts)
map('n', '<C-k>', '<Cmd>wincmd k<CR>', opts)
map('n', '<C-l>', '<Cmd>wincmd l<CR>', opts)

-- Hop
map('n', '<Leader>ww', '<Cmd>HopWord<CR>', opts)
map('n', '<Leader>ll', '<Cmd>HopLine<CR>', opts)