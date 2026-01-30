local set_lsp_keymaps = function()
    local wk = require("which-key")
    wk.add({
        { "<leader>l", group = "lsp" },
        { "gd",        vim.lsp.buf.definition,  desc = "LSP goto definition" },
        { "gD",        vim.lsp.buf.declaration, desc = "LSP goto declaration" },
        { "K",         vim.lsp.buf.hover,       desc = "LSP Hover" },
        { "grr",       vim.lsp.buf.references,  desc = "LSP Show References" },
    })
end

local set_rust_lsp_keymaps = function()
    local wk = require("which-key")
    wk.add({
        { "<leader>l",  group = "lsp" },
        { "gd",         vim.lsp.buf.definition,                                 desc = "LSP goto definition" },
        { "gD",         vim.lsp.buf.declaration,                                desc = "LSP goto declaration" },
        { "K",          vim.lsp.buf.hover,                                      desc = "LSP Hover" },
        { "<leader>K",  function() vim.cmd.RustLsp({ 'hover', 'actions' }) end, desc = "LSP Hover Actions" },
        { "grr",        vim.lsp.buf.references,                                 desc = "LSP Show References" },
        { "<leader>ee", function() vim.cmd.RustLsp('explainError') end,         desc = "Explain the error in popup window" },
    })
end


return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        automatic_enable = { "lua_ls", },
                        ensure_installed = { "lua_ls" },
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
            vim.lsp.config('pylsp', {
                capabilities = capabilities,
                on_attach = function(_, _)
                    set_lsp_keymaps()
                end,
            })
            vim.lsp.config('clangd', {
                capabilities = capabilities,
                on_attach = function(_, _)
                    set_lsp_keymaps()
                end,
            })
            vim.lsp.enable({ 'pylsp', 'clangd' })

            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")
            if not configs.oxide_hdl then
                configs.oxide_hdl = {
                    default_config = {
                        cmd = { "/home/pat/workspace/oxide-hdl/target/release/oxide-hdl" },
                        filetypes = { "vhdl" },
                        root_dir = function(fname)
                            return lspconfig.util.root_pattern(".git")(fname) or vim.fn.getcwd()
                        end,
                        settings = {},
                    }
                }
            end
            lspconfig.oxide_hdl.setup({
                capabilities = capabilities,
                on_attach = function(_, _)
                    set_lsp_keymaps()
                    vim.notify("Oxide-hdl attached!!!", vim.log.levels.INFO)
                end,
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false,   -- This plugin is already lazy
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            -- local extension_path = "/home/pgrogan/.local/bin/extension/"
            -- local codelldb_path = extension_path .. "adapter/codelldb"
            -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(_, _)
                        set_rust_lsp_keymaps()
                    end
                },
                -- dap = {
                --     adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                -- },
                tools = {
                    enable_clippy = true, -- Enable Clippy
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
