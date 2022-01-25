local lspkind = require'lspkind'
-------------------------------------------------------------------------------
-- CMP
-------------------------------------------------------------------------------
local cmp = require'cmp'
cmp.setup{
    formatting = {
        format = lspkind.cmp_format {
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
            },
        },
    },
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}
