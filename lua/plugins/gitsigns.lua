require('gitsigns').setup {
 keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
  },
  current_line_blame = true
}

local gitsigns = require"gitsigns"

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>')
vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk)
vim.keymap.set('n', '<leader>gp', gitsigns.prev_hunk)
vim.keymap.set('n', '<leader>gsh', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>gsb', gitsigns.stage_buffer)
vim.keymap.set('n', '<leader>grh', gitsigns.reset_hunk)
vim.keymap.set('n', '<leader>grb', gitsigns.reset_buffer)
vim.keymap.set('n', '<leader>gbl', '<cmd>lua require"gitsigns".blame_line(true)')
vim.keymap.set('n', '<leader>gbt', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', '<leader>gP', '<cmd>!git push<cr>')
