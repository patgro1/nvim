local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c", 'src/scanner.cc' },
        branch = "main"
    },
}
parser_configs.org = {
    install_info = {
        url = 'https://github.com/milisims/tree-sitter-org',
        revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
        files = {'src/parser.c', 'src/scanner.cc'},
    },
    filetype = 'org',
}

parser_configs.org = {
    install_info = {
        url = 'https://github.com/milisims/tree-sitter-org',
        revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
        files = {'src/parser.c', 'src/scanner.cc'},
    },
    filetype = 'org'
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
        -- "norg",
        "org"
    },
    highlight = {
        enable = true,
        --disable = {'org'},
        additional_vim_regex_highlighting = {'org'},
    },
    rainbow = {enable = true}
}
