local mason_install_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
local codelldb_path = mason_install_path .. 'adapter/codelldb'
local liblldb_path = mason_install_path .. 'lldb/lib/liblldb.so'

-- TODO: This is duplicate... need to find somewhere else to put these bindings
on_attach = function(client, buffer)
    -- keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
    vim.keymap.set('n', '<C-space>', require("rust-tools").hover_actions.hover_actions)
end

local rust_opts = {
    server = {
        on_attach = on_attach
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

require("rust-tools").setup(rust_opts)
