-- Leader on spacebar
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ' '

-- This helper function will take a mode, a binding and a function, a bool for noremap and a bool for silent
-- and map it into the vim api
function map_keybind(mode, key, fn, noremap, silent)
    noreamp = noremap or true
    silent = silent or true
    vim.api.nvim_set_keymap(mode, key, fn, {noremap = noremap, silent=silent})
end

-- No highlight
map_keybind('n', '<Leader>,', ':set hlsearch!<CR>', true, true)

-- Buffer control
map_keybind('n', '<Leader>bn', ':bnext<CR>', true, true)
map_keybind('n', '<Leader>bp', ':bprevious<CR>', true, true)
map_keybind('n', '<Leader>bb', ':Telescope buffers<CR>', true, true)

-- File management
map_keybind('n', '<Leader>ff', ':Telescope find_files<CR>', true, true)
map_keybind('n', '<Leader>fp', ':Telescope git_files<CR>', true, true)
map_keybind('n', '<Leader>fg', ':Telescope live_grep<CR>', true, true)
--vim.api.nvim_set_keymap('n', '<Leader>,', ':set hlsearch!<CR>', {noremap = true, silent = true})




