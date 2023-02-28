return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "onsails/lspkind-nvim",
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            {
                'saadparwaiz1/cmp_luasnip',
                dependencies = {
                    "L3MON4D3/LuaSnip",
                    dependencies = {
                        "rafamadriz/friendly-snippets",

                    }
                }
            }
        },
        config = function ()
            vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
            local cmp = require'cmp'
            local luasnip = require'luasnip'
            local select_opts = {behavior = cmp.SelectBehavior.Select}
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup ({
                formatting = {
                    format = require'lspkind'.cmp_format({
                        mode = "symbol_text"
                    }),

                },
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered()
                },
                sources = {
                    { name = 'nvim_lua' },
                    { name = 'luasnip'  },
                    { name = 'nvim_lsp' },
                    { name = 'buffer'   },
                    { name = 'path'     }
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
                    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
                    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
                    ["<Down>"] = cmp.mapping.select_next_item(select_opts),
                    ["<C-b>"] =  cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] =  cmp.mapping.scroll_docs(4),
                    ["<C-space>"] =  cmp.mapping.complete(),
                    ["<CR>"] =  cmp.mapping.confirm({ select=true }), -- When nothing is selected, take first item
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" })
                })
            })
        end
    },
    {
        "numToStr/Comment.nvim",
        event="BufReadPost",
        config = function ()
            require'Comment'.setup()
            local ft = require'Comment.ft'
            ft.set('vhdl', '--%s')
        end
    },
    {
        "folke/todo-comments.nvim",
        event="BufReadPost",
        cmd= "TodoTelescope",
        config = function ()
            require'todo-comments'.setup()
        end
    },
    {
        "folke/trouble.nvim",
        requires= 'nvim-tree/nvim-web-devicons',
        config = function()
            require'trouble'.setup {
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
    {
        "Vonr/align.nvim",
        keys = {
            {
                "aa",
                function()
                    require'align'.align_to_char(1, true)
                end,
                mode='x'
            },
            {
                "as",
                function()
                    require'align'.align_to_char(2, true, true)
                end,
                mode='x'
            }
        }
    },
    {
        -- aliases for surround char:
        --
        "kylechui/nvim-surround",
        version = "v1.x.x",
        event = "BufReadPost",
        config = function()
            require'nvim-surround'.setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "sa",
                    normal_cur = "yss",
                    normal_line = "yS",
                    normal_cur_line = "ySS",
                    visual = "S",
                    visual_line = "gS",
                    delete = "sd",
                    change = "sr",
                },
                -- NOTE: these are the default aliases... its just to keep track of them
                aliases = {
                    ["a"] = ">",
                    ["b"] = ")",
                    ["B"] = "}",
                    ["r"] = "]",
                    ["q"] = { '"', "'", "`" },
                    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
                },
            })
        end
    }
}
