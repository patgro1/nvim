return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        opts = {
            ensure_installed = {
                "bash",
                "cmake",
                "cpp",
                "fish",
                "go",
                "javascript",
                -- "latex",
                "lua",
                "norg",
                "python",
                "rst",
                "rust",
                -- "systemverilog",
                "verilog",
                "vhdl",
                "yaml",
            },
            highlight = {
                enable = true,
                -- disable = { "vhdl" },
                additional_vim_regex_highlighting = { "python" },
            },
            context_commentstring = {
                enable = true,
            },
        },
        build = ":TSUpdate",
        config = function(_, opts)
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.vhdl = {
                install_info = {
                    url = "/home/pat/workspace/oxide-hdl/tree-sitter-vhdl/",
                    files = { "src/parser.c", "src/scanner.c" },
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
                filetype = "vhdl",
            }
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/playground",
        cmd = {
            "TSPlaygroundToggle",
        },
    },
}
