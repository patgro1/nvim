return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            {
                "mason.nvim",
                {
                    "williamboman/mason-lspconfig.nvim",
                    opts = {
                        ensure_installed = {
                            "sumneko_lua",
                            "pyright",
                            "rust_analyzer",
                            "vuels"
                        }
                    },
                    config = function(_, opts)
                        require("mason-lspconfig").setup(opts)
                    end
                },
                {
                    'simrat39/rust-tools.nvim',
                    config = function ()
                        require('rust-tools').setup({
                            server = {
                                on_attach = require"plugins.lsp.keymaps".on_attach,
                                settings = {
                                    ['rust-analyzer'] = {
                                        checkOnSave = {
                                            command = "clippy"
                                        }
                                    }
                                }
                            }
                        })
                    end
                }

            },
        },
        opts = {
            servers = {
                sumneko_lua = {
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            }
        },
        config = function ()
            require('lspconfig').sumneko_lua.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                },
                on_attach = require'plugins.lsp.keymaps'.on_attach
            })
            require('lspconfig').pyright.setup({
                on_attach = require'plugins.lsp.keymaps'.on_attach
            })
            require('lspconfig').vuels.setup({
                on_attach = require'plugins.lsp.keymaps'.on_attach
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function(_, opts)
            require("mason").setup(opts)
        end
    }
}
