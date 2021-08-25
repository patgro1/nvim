M = {}

require('telescope').setup()
require('telescope').load_extension('fzy_native')
require("telescope").load_extension("git_worktree")
local telescope_builtin = require 'telescope.builtin'

M.find_files = function()
    telescope_builtin.find_files({
        find_command = {'rg', '--files', '--hidden', '-g', '!.git' },
    })
end

M.get_vim_config = function ()
    telescope_builtin.find_files({
            prompt_title = "< VimRC >",
            cwd = "$HOME/.config/nvim/",
        })
end

return M
