local M = {}

function M.on_attach(client, buffer)
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

return M;
