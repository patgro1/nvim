return {
    {
        -- Treesitter and utilities
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        config = function()
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.vhdl = {
                install_info = {
                    url = "~/workspace/tree-sitter-vhdl", -- local path or git repo
                    files = { "src/parser.c" },
                    -- optional entries:
                    branch = "main", -- default branch in case of git repo if different from master
                    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
                },
                filetype = "vhdl", -- if filetype does not match the parser name
                require("nvim-treesitter.configs").setup({
                    ensure_installed = {
                        "python",
                        "cpp",
                        "verilog",
                        "lua",
                        "yaml",
                        "bash",
                        "cmake",
                        "latex",
                        "rust",
                        -- "vhdl"
                    },
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = { "python" },
                    },
                    rainbow = { enable = true },
                }),
            }
        end,
        build = ":TSUpdate",
        dependencies = {
            "p00f/nvim-ts-rainbow",
        },
    },
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
}
