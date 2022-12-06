M = {}

require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzf')
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

M.get_dot_files = function ()
    telescope_builtin.find_files({
            find_command = {'rg', '--files', '--hidden', '-g', '!.git' },
            prompt_title = "< Dotfiles >",
            cwd = "$HOME/dotfiles"
        })
end

return M
