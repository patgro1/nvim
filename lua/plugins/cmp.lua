-------------------------------------------------------------------------------
-- CMP
-------------------------------------------------------------------------------
local cmp = require'cmp'
cmp.setup{
    sources = {
        { name = 'buffer' },
        { name = 'lsp' },
    },
}
vim.cmd [[ autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'nvim_lua' }, }, } ]]
