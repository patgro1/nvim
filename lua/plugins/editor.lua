local open_lazy_git = function()
    local terminal = require("toggleterm.terminal").Terminal
    local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    lazygit:toggle()
end
return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                version = "1.x",
                config = function()
                    require("window-picker").setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            bo = {
                                -- Ignore these filetype for window selection
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },

                                -- ignore there buftype for window selection
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                        other_win_hl_color = "#e35e4f",
                    })
                end,
            },
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["<CR>"] = "open_with_window_picker",
                        ["s"] = "split_with_window_picker",
                        ["S"] = "vsplit_with_window_picker",
                    },
                },
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute({ toggle = true })
                end,
                desc = "File explorer",
            },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({})
        end,
        keys = {
            {
                "<leader>gl",
                open_lazy_git,
                desc = "Open lazygit",
            },
        },
    },
    {
        "NeogitOrg/neogit",
        config = function()
            require('neogit').setup({})
        end,
        keys = {
            {
                "<leader>gg",
                function()
                    require('neogit').open()
                end,
                desc = "Open lazygit",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
    },
    {
        "sindrets/diffview.nvim",
        keys = {
            {
                "<leader>gd",
                function()
                    if next(require("diffview.lib").views) == nil then
                        require("diffview").open()
                    else
                        require("diffview").close()
                    end
                end,
                desc = "open diffview",
            },
        },
    },
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },
    {
        "Rykka/InstantRst",
        ft = "rst"
    },
    {
        event = "BufReadPre",
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                {
                    window = {
                        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                        width = 0.85,    -- width of the Zen window (<= 1 is % of window)
                        height = 1,      -- height of the Zen window
                    },
                    plugins = {
                        -- disable some global vim options (vim.o...)
                        -- comment the lines to not apply the options
                        options = {
                            enabled = true,
                            ruler = false,          -- disables the ruler text in the cmd line area
                            showcmd = false,        -- disables the command in the last line of the screen
                        },
                        tmux = { enabled = false }, -- disables the tmux statusline
                        -- this will change the font size on alacritty when in zen mode
                        -- requires  Alacritty Version 0.10.0 or higher
                        -- uses `alacritty msg` subcommand to change font size
                        alacritty = {
                            enabled = false,
                            font = "14", -- font size
                        },
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>zz",
                function()
                    require("zen-mode").toggle()
                end,
                desc = "Enable zen mode",
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,  -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "single",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                yadm = {
                    enable = false,
                },
            })
        end,
        keys = {
            {
                "<leader>gb",
                function()
                    require("gitsigns").toggle_current_line_blame()
                end,
                desc = "Toggle git blame line",
            },
        },
    },
    {
        "ThePrimeagen/harpoon",
        -- branch = "harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
        },
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon.mark").add_file()
                end,
                desc = "Add file to harpoon"
            },
            {
                "<C-e>",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                desc = "Open harpoon menu"
            }
        }
    },
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            nvim_tmux_nav.setup {}
            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    }
}
