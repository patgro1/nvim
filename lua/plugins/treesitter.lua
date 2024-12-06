return {
    {
        -- Treesitter and utilities
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "cmake",
                    "cpp",
                    "fish",
                    "go",
                    "javascript",
                    "latex",
                    "lua",
                    "norg",
                    "python",
                    "rst",
                    "rust",
                    "systemverilog",
                    "verilog",
                    "vhdl",
                    "yaml",
                },
                highlight = {
                    enable = true,
                    -- disable = { "vhdl" },
                    additional_vim_regex_highlighting = { "python" },
                }
                --     },
                -- }),
            })
        end,
        build = ":TSUpdate",
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "BufReadPost",
        config = function()
            local rainbow_delimiters = require('rainbow-delimiters')
            require 'rainbow-delimiters.setup'.setup({
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                    vhdl = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                    vhdl = 'rainbow-delimiters'

                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            })
        end
    },
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
}
