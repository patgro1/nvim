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
map('n', '<leader>j', ":m .+1<CR>==", {noremap = true})
map('n', '<leader>k', ":m .-2<CR>==", {noremap = true})

-- Buffers
map('n', '<leader>bb', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<s-tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>bn', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>bp', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
map('n', '<leader>bk', '<Cmd>BufferDelete<CR>', opts)

-- Telescope
map('n', '<leader>ff', '<Cmd>lua require"plugins.telescope".find_files()<CR>', opts)
map('n', '<leader> ', '<Cmd>Telescope git_files<CR>', opts)
map('n', '<leader>fg', '<Cmd>Telescope git_files<CR>', opts)
map('n', '<leader>fh', '<Cmd>lua require"telescope.builtin".oldfiles()<CR>', opts)
map('n', '<leader>fc', '<Cmd>lua require"plugins.telescope".get_vim_config()<CR>', opts)
map('n', '<leader>ss', '<Cmd>Telescope grep_string<CR>', opts)
map('n', '<leader>sg', '<Cmd>Telescope live_grep<CR>', opts)

-- Git
--
map('n', '<leader>gg', '<Cmd>Neogit<CR>', opts)
map('n', '<leader>gn', '<Cmd>lua require"gitsigns".next_hunk()<CR>', opts)
map('n', '<leader>gp', '<Cmd>lua require"gitsigns".previous_hunk()<CR>', opts)
map('n', '<leader>gsh', '<Cmd>lua require"gitsigns".stage_hunk()<CR>', opts)
map('n', '<leader>gsf', '<Cmd>lua require"gitsigns".stage_buffer()<CR>', opts)
map('n', '<leader>grh', '<Cmd>lua require"gitsigns".reset_hunk()<CR>', opts)
map('n', '<leader>grf', '<Cmd>lua require"gitsigns".reset_buffer()<CR>', opts)
map('n', '<leader>gbl', '<Cmd>lua require"gitsigns".blame_line(true)<CR>', opts)
map('n', '<leader>gbt', '<Cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', opts)
map('n', '<leader>gpp', '<Cmd>!git push<CR>', opts)

-- Git worktrees
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

-- Harpoon
map('n', '<C-e>', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<leader>hc', '<Cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)
map('n', '<leader>a', '<Cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<C-s>', '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', '<C-d>', '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<C-f>', '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<C-g>', '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)
