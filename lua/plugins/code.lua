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
            { 'saadparwaiz1/cmp_luasnip', dependencies = "L3MON4D3/LuaSnip" }
        },
        config = function ()
            vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
            local cmp = require'cmp'
            local select_opts = {behavior = cmp.SelectBehavior.Select}
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
    }
}
