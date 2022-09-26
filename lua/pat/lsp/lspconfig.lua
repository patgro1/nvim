local on_attach = function(client, buffer)
end

require('lspconfig').sumneko_lua.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
