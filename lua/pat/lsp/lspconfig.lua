local on_attach = function(client, buffer)
    -- keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
end

require('lspconfig').sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

require('lspconfig').pylsp.setup({
    on_attach = on_attach,
})

require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach
})

-- Some autocmd used with LSP
local rust_grp = vim.api.nvim_create_augroup("RustAuto", {clear=true})

vim.api.nvim_create_autocmd("BufWritePre",{
    group = rust_grp,
    pattern = "*.rs",
    command = "lua vim.lsp.buf.format()"
    }
)
