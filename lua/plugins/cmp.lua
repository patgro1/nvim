local lspkind = require'lspkind'
-------------------------------------------------------------------------------
-- CMP
-------------------------------------------------------------------------------
local cmp = require'cmp'
cmp.setup{
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            return vim_item
        end
    },
    sources = {
        { name = 'buffer' },
        { name = 'lsp' },
    },
}
vim.cmd [[ autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } }, } ]]
