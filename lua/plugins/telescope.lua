return {
    {
        'nvim-telescope/telescope.nvim',
        version = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end
            },
            "nvim-telescope/telescope-symbols.nvim"

        },
        config = function()
            require('telescope').setup()
        end,
        cmd = {"TodoTelescope"},
        keys = {
            {
                "<leader>bb",
                function()
                    require'telescope.builtin'.buffers()
                end,
                desc = "Telescope buffers"
            },
            {
                "<leader>ff",
                function ()
                    require'telescope.builtin'.find_files({
                        find_command = {'rg', '--files', '--hidden', '-g', '!.git' },
                    })
                end,
                desc = "Find all files"
            },
            {
                "<leader>fg",
                function()
                    require'telescope.builtin'.git_files()
                end,
                desc = "Find in git files"
            },
            {
                "<leader><space>",
                function()
                    local _, ret, _ = require'telescope.utils'.get_os_command_output({"git", "rev-parse", "--is-inside-work-tree"})
                    if ret == 0 then
                        require'telescope.builtin'.git_files()
                    else
                        require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' },})
                    end
                end,
                desc = "Find in project files (if not git, find all files)"
            },
            {
                "<leader>fh",
                function()
                    require'telescope.builtin'.oldfiles()
                end,
                desc = "Find file in history"
            },
            {
                "<leader>fp",
                function()
                    require'telescope.builtin'.git_files({
                        prompt_title = "< VimRC >",
                        cwd = "$HOME/.config/nvim"
                    })
                end,
                desc = "Find file in vim config"
            },
            {
                "<leader>fd",
                function()
                    require'telescope.builtin'.find_files({
                        find_command = {'rg', '--files', '--hidden', '-g', '!.git' },
                        prompt_title = "< Dotfiles >",
                        cwd = "$HOME/dotfiles"
                    })
                end,
                desc = "Find file in dot files"
            },
            {
                "<leader>hh",
                function()
                    require'telescope.builtin'.help_tags()
                end,
                desc = "Search in help"
            },
            {
                "<leader>ii",
                "<Cmd>Telescope symbols<cr>",
                desc = "Search in help"
            },
            {
                "<leader>ss",
                function ()
                    require'telescope.builtin'.grep_string{
                        shorten_path = true, word_match = "-w", only_sort_text = true
                    }
                end
            },
            {
                "<leader>gs",
                function ()
                    require'telescope.builtin'.live_grep{
                        shorten_path = true, word_match = "-w", only_sort_text = true, search = "\'\'" }
                end
            }


        }
    }
}
