return {
    {
        "saghen/blink.cmp",
        lazy = false,
        version = "v1.*",
        opts = {
            -- 1. ADD THIS 'completion' BLOCK
            completion = {
                menu = {
                    draw = {
                        -- We define 3 columns.
                        -- The middle column contains the name (label) AND the detail (label_description)
                        columns = {
                            { "kind_icon" },
                            { "label",    "label_description", gap = 1 }
                        },
                    },
                },
                -- Optional: Ensure documentation window pops up automatically
                documentation = {
                    auto_show = false,
                    auto_show_delay_ms = 500,
                },
            },

            -- ... Keep your existing settings below ...
            keymap = { preset = "default" },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
        opts_extend = { "sources.default" },
    },
}
