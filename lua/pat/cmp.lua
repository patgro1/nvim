local lspkind = require'lspkind'
local cmp = require'cmp'


cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = {
                buffer = "[buf]",
                nvim_lua = "[api]",
                path = "[path]",
            },
        }),
    },
    sources = {
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mappings = cmp.mapping.preset.insert({
        ["<C-b>"] =  cmp.mapping.scroll_docs(-4),
        ["<C-f>"] =  cmp.mapping.scroll_docs(4),
        ["<C-space>"] =  cmp.mapping.complete(),
        ["<CR>"] =  cmp.mapping.confirm({ select=true }), -- When nothing is selected, take first item
    }),
}
