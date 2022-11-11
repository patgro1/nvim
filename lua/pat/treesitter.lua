require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "python",
        "cpp",
        "verilog",
        "lua",
        "yaml",
        "bash",
        "cmake",
        "latex",
        "rust"
    },
    highlight = {
        enable = true,
        disable = {"python", }
    },
    rainbow = {enable = true}
}
