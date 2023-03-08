return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = 'BufReadPost'
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
                config = function ()
                    require'window-picker'.setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            bo = {
                                -- Ignore these filetype for window selection
                                filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

                                -- ignore there buftype for window selection
                                buftype = { 'terminal', 'quickfix' }
                            },
                        },
                        other_win_hl_color = '#e35e4f'
                    })
                end
            }
        },
        config = function ()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["<CR>"] = "open_with_window_picker",
                        ["s"] = "split_with_window_picker",
                        ["S"] = "vsplit_with_window_picker"
                    }
                },
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                    }
                }
            })
        end,
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute({toggle = true})
                end,
                desc = "File explorer"
            }
        }
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require'toggleterm'.setup({})
        end,
        keys = {
            {
                "<leader>gg",
                function()
                    local terminal = require'toggleterm.terminal'.Terminal
                    local lazygit = terminal:new({ cmd="lazygit", hidden=true, direction="float"})
                    lazygit:toggle()
                end,
                desc = "Open lazygit"
            }
        }

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
        config = function()
            require'colorizer'.setup()
        end
    },

}
