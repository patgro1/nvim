local lspkind = require'lspkind'
local cmp = require'cmp'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup ({
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text"
        }),
    },
    window = {
        completion = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
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
    }),
})
