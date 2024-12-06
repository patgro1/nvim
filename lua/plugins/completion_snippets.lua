-- This function check if the file size is too big for using
-- treesitter completion
local BufIsBig = function(bufnr)
    local max_filesize = 100 * 1024 -- 10KB NOTE: this could be fine tuned
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    if ok and stats and stats.size > max_filesize then
        return true
    end
    return false
end

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- sources
        "onsails/lspkind-nvim",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        -- {
        --     'quangnguyen30192/cmp-nvim-tags',
        --     ft = { 'vhdl' }
        -- },
        'ray-x/cmp-treesitter',

        -- snippets
        {
            'saadparwaiz1/cmp_luasnip',
            dependencies = {
                'L3MON4D3/LuaSnip',
                dependencies = { "rafamadriz/friendly-snippets" },
            }
        },
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
        local cmp = require('cmp')
        local luasnip = require 'luasnip'
        local select_opts = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            formatting = {
                format = require "lspkind".cmp_format({
                    mode = "symbol",
                }),
            },
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
                ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
                ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
                ["<Down>"] = cmp.mapping.select_next_item(select_opts),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_selected_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
                }),
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
        local default_cmp_sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            -- { name = 'tags' }
        }, {
            { name = 'buffer' },
            { name = 'path' }
        })
        vim.api.nvim_create_autocmd('BufReadPre', {
            callback = function(t)
                local sources = default_cmp_sources
                if not BufIsBig(t.buf) then
                    sources[#sources + 1] = { name = 'treesitter', group_index = 1 }
                end
                cmp.setup.buffer {
                    sources = sources
                }
            end
        })
    end
}
