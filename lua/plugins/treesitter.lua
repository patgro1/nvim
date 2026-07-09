return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "bash", "cmake", "cpp", "fish", "go", "javascript",
                "lua", "norg", "python", "rst", "rust", "verilog",
                "vhdl", "yaml",
            },
            highlight = { enable = true },
        },
        config = function(_, opts)
            local parsers = require("nvim-treesitter.parsers")

            -- 1. Try to find the config table wherever it's hiding
            -- In the latest 'main', it's usually nvim-treesitter.parsers.list
            -- but let's fall back to get_parser_configs if list is nil.
            local parser_config = parsers.list or (parsers.get_parser_configs and parsers.get_parser_configs())

            if parser_config then
                parser_config.vhdl = {
                    install_info = {
                        url = "/home/pgrogan/workspace/oxide-hdl/tree-sitter-vhdl/",
                        files = { "src/parser.c", "src/scanner.c" },
                        generate_requires_npm = false,
                        requires_generate_from_grammar = false,
                    },
                    filetype = "vhdl",
                }
            end

            -- 2. Setup using the correct top-level module
            require("nvim-treesitter").setup(opts)
        end,
    },
}
