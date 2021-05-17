local data_path = vim.fn.stdpath('data') .. "/"
local tsserver_root_path = data_path .. "lspinstall/typescript/"

local bin_name = tsserver_root_path .. "node_modules/.bin/typescript-language-server"

require'lspconfig'.tsserver.setup {
    cmd = {bin_name, "--stdio"}
}
