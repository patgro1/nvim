return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            {
                "mason.nvim",
                {
                    "williamboman/mason-lspconfig.nvim",
                    opts = {
                        ensure_installed = {
                            "lua_ls",
                            "jedi_language_server",
                            "rust_analyzer",
                            "vuels",
                        },
                    },
                    config = function(_, opts)
                        require("mason-lspconfig").setup(opts)
                    end,
                },
                {
                    "simrat39/rust-tools.nvim",
                    dependencies = {
                        {
                            "rcarriga/nvim-dap-ui",
                        },
                    },
                    config = function()
                        require("rust-tools").setup({
                            server = {
                                on_attach = function(_, bufnr)
                                    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                                    vim.api.nvim_create_autocmd("BufWritePre", {
                                        group = augroup,
                                        buffer = bufnr,
                                        callback = function()
                                            vim.lsp.buf.format({ bufnr = bufnr })
                                        end,
                                    })
                                    require("plugins.lsp.keymaps").on_attach()
                                end,
                                settings = {
                                    ["rust-analyzer"] = {
                                        checkOnSave = {
                                            command = "clippy",
                                        },
                                        procMacro = {
                                            enable = true,
                                        },
                                    },
                                },
                            },
                            dap = {
                                adapter = require("dap").adapters.codelldb,
                            },
                        })
                    end,
                },
            },
        },
        opts = {
            servers = {
                sumneko_lua = {
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
                },
            },
        },

        config = function()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        format = {
                            enable = true,
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = "2",
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
                on_attach = function(client, bufnr)
                    require("plugins.lsp.keymaps").on_attach()
                    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            })
            require("lspconfig").jedi_language_server.setup({
                on_attach = require("plugins.lsp.keymaps").on_attach,
            })
            require("lspconfig").vuels.setup({
                on_attach = require("plugins.lsp.keymaps").on_attach,
            })
            local configs = require("lspconfig.configs")
            configs.vhdl_ls = {
                default_config = {
                    cmd = { "vhdl_ls" },
                    filetypes = { "vhdl" },
                    root_dir = require("lspconfig.util").find_git_ancestor,
                    setting = {},
                },
            }
            -- require("lspconfig").vhdl_ls.setup({
            --     on_attach = require("plugins.lsp.keymaps").on_attach,
            -- })
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.flake8,
                    null_ls.builtins.diagnostics.mypy,
                    null_ls.builtins.formatting.black,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
