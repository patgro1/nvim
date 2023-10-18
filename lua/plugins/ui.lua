return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = "v3.x",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require 'bufferline'.setup({
                options = {
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, _, _)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Neotree",
                            text_align = "left",
                        }
                    }
                }
            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require 'utils.lualine'.config_lualine()
        end
    },
    {
        "karb94/neoscroll.nvim",
        event = "BufReadPre",
        config = function()
            require('neoscroll').setup()
        end
    }
}
