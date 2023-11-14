return {
    {
        -- Treesitter and utilities
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        config = function()
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.vhdl = {
                install_info = {
                    url = "~/workspace/tree-sitter-vhdl-existing", -- local path or git repo
                    files = { "src/parser.c" },
                    -- optional entries:
                    branch = "main",                        -- default branch in case of git repo if different from master
                    generate_requires_npm = false,          -- if stand-alone parser without npm dependencies
                    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
                },
                filetype = "vhdl",                          -- if filetype does not match the parser name
                require("nvim-treesitter.configs").setup({
                    ensure_installed = {
                        "bash",
                        "cmake",
                        "cpp",
                        "fish",
                        "javascript",
                        "latex",
                        "lua",
                        "python",
                        "rst",
                        "rust",
                        "verilog",
                        "vhdl",
                        "yaml",
                    },
                    highlight = {
                        enable = true,
                        -- disable = { "vhdl" },
                        additional_vim_regex_highlighting = { "python" },
                    },
                }),
            }
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
