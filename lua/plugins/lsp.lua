local set_lsp_keymaps = function()
    local wk = require("which-key")
    wk.add({
        { "<leader>l", group = "lsp" },
        { "<leader>lgd", vim.lsp.buf.definition, desc = "LSP goto definition" },
        { "<leader>lgD", vim.lsp.buf.declaration, desc = "LSP goto declaration" },
        { "<leader>lK", vim.lsp.buf.hover, desc = "LSP Hover" },
        { "<leader>lvrr", vim.lsp.buf.references, desc = "LSP Show References" },
    })
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover)
    -- vim.keymap.set("n", "vrr", vim.lsp.buf.references)
    -- vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
    -- vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
    -- vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev)
    -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    -- vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
    -- vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help)

    --vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions)
end

return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        ensure_installed = { "lua_ls", "rust_analyzer" },
                    })
                end,
            },
            "saghen/blink.cmp",
        },
        config = function()
            -- Configure nvim diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "",
                    },
                },
            })
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        format = {
                            enable = true,
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = "4",
                            },
                        },
                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
                on_attach = function(_, bufnr)
                    set_lsp_keymaps()
                end,
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local extension_path = "/home/pgrogan/.local/bin/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            local cfg = require("rustaceanvim.config")
            vim.g.rustaceanvim = {
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            }
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
}
