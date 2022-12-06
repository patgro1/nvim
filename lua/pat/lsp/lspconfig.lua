-- TODO: This is duplicate... need to find somewhere else to put these bindings
on_attach = function(client, buffer)
    -- keymaps
    if (client.name == "veridian") then
        vim.keymap.set('n', 'gtt', ":tjump <C-r><C-w><CR>")
    else
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
        vim.keymap.set('n', '<C-space>', require("rust-tools").hover_actions.hover_actions)
    end
    vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)

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

require'lspconfig'.veridian.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = function() return vim.loop.cwd() end
}


-- Setting the diagnostic in floating
vim.diagnostic.config({
    virtual_text=false
})
local diag_grp = vim.api.nvim_create_augroup("DiagGrp", {clear=true})
vim.api.nvim_create_autocmd("CursorHold", {
    group = diag_grp,
    pattern = "*",
    command = "lua vim.diagnostic.open_float()"
    }
)
vim.o.updatetime=500

-- Some autocmd used with LSP
local rust_grp = vim.api.nvim_create_augroup("RustAuto", {clear=true})

vim.api.nvim_create_autocmd("BufWritePre",{
    group = rust_grp,
    pattern = "*.rs",
    command = "lua vim.lsp.buf.format()"
    }
)
