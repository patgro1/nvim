return {
    "nvim-neorg/neorg",
    dependencies = {
        {
            "vhyrro/luarocks.nvim",
            priority = 1000,
            config = true,
        },
        "nvim-lua/plenary.nvim"
    },
    lazy = false,
    -- build = ":Neorg sync-parsers",
    version = "*",
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        }
                    }
                }
            }
        }
    end,
}
