require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "python",
        "cpp",
        "verilog",
        "lua",
        "yaml",
        "bash",
        "cmake",
    },
    highlight = {
        enable = true
    },
    rainbow = {enable = true}
}
