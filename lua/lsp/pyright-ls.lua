local data_path = vim.fn.stdpath('data') .. "/"
local pyright_root_path = data_path .. "lspinstall/python/"
local pyright_binary = pyright_root_path .. "node_modules/.bin/pyright-langserver"
require'lspconfig'.pyright.setup {
    cmd = { pyright_binary, "--stdio" }
}
