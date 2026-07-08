return {
    {
        "saghen/blink.cmp",
        lazy = false,
        version = "v1.*",
        opts = {
            -- 1. Adjust completion behavior
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label",    "label_description", gap = 1 }
                        },
                    },
                },
                -- This allows the menu to trigger even if you haven't typed anything
                trigger = {
                    show_on_keyword = true,
                    show_on_trigger_character = true,
                    show_on_accept_on_trigger_character = true,
                },
                documentation = {
                    auto_show = false,
                    auto_show_delay_ms = 500,
                },
            },

            -- 2. ADD CUSTOM KEYMAPS HERE
            keymap = {
                preset = "default",
                -- Manually show the completion menu
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                -- Optional: Ensure providers don't require minimum characters
                min_keyword_length = 0,
            },
        },
        opts_extend = { "sources.default" },
    },
}
