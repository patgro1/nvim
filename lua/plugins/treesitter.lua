local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c", 'src/scanner.cc' },
        branch = "main"
    },
}

require'nvim-treesitter.configs'.setup{
    ensure_installed = {
        "python",
        "cpp",
        "verilog",
        "lua",
        "yaml",
        "bash",
        "cmake",
        "c",
        "norg"
    },
    highlight = {
        enable = true
    },
    rainbow = {enable = true}
}
