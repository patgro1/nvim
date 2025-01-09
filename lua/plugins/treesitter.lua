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
        },
        build = ":TSUpdate",
        config = function(_, opts)
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
