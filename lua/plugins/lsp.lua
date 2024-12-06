local set_lsp_keymaps = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "vrr", vim.lsp.buf.references)
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
    vim.keymap.set({ 'n', 'i' }, "<C-s>", vim.lsp.buf.signature_help)

    --vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions)
end

return {

    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason.nvim",
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason").setup()
                    require("mason-lspconfig").setup({
                        ensure_installed = {
                            "lua_ls",
                            "pyright",
                            "gopls"
                        }
                    })
                end
            }
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
            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")
            lspconfig.lua_ls.setup({
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
                on_attach = function(_, bufnr)
                    set_lsp_keymaps()
                    -- Autoformating on save
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
            if not configs.vhdl_ls then
                configs.vhdl_ls = {
                    default_config = {
                        cmd = { '/home/pgrogan/workspace/perso/rust_hdl/target/release/vhdl_ls' },
                        root_dir = lspconfig.util.root_pattern('vhdl_ls.toml'),
                        filetypes = { 'vhdl' },
                    },
                }
            end
            -- lspconfig.vhdl_ls.setup({
            --     on_attach = function(_, bufnr)
            --         set_lsp_keymaps()
            --     end
            -- })

            -- lspconfig.jedi_language_server.setup {}
            lspconfig.pyright.setup {}
            lspconfig.gopls.setup {
                settings = {
                    gopls = {
                        gofumpt = true
                    }
                }
            }
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    },
    {
        "folke/trouble.nvim",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require 'trouble'.setup {
            }
        end,
        keys = {
            {
                "<leader>xx",
                function()
                    require("trouble").toggle()
                end
            }
        }
    },
}
