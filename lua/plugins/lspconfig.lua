local on_attach = function(client, bufnr)
    -- LSP Mappings
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
--             f = {
--                 name = 'Find',
--                 r =  {'<Cmd>lua vim.lsp.buf.references()<CR>', 'References'}
--             },
--             c = {
--                 name = "Code action",
--                 c = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Menu' },
--             },
--             h = {
--                 name = 'Documentation',
--                 s = { '<Cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help'}
--             },
--         },
-- }, {prefix = '<leader>'})
end

local data_path = vim.fn.stdpath('data')
local lsp_server_internal_path = data_path .. '/lsp_servers'
local lspconfig = require'lspconfig'

-- Lua configuration
local sumneko_root_path = lsp_server_internal_path .. "/lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, '-E', sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] =true},
                maxPreload = 1000
            }
        }
    }
}
-------------------------------------------------------------------------------
-- PYRIGHT LS
-------------------------------------------------------------------------------
local pyright_root_path = vim.env.HOME .. "/virtualenvs/editor"
local pyright_binary = pyright_root_path .. "/bin/pyright-langserver"
require'lspconfig'.pyright.setup {
    on_attach = on_attach,
    cmd = { pyright_binary, "--stdio" }
}


-------------------------------------------------------------------------------
-- PYLSP
-------------------------------------------------------------------------------
-- local pylsp_root_path = vim.env.HOME .. "/virtualenvs/editor"
-- local pylsp_binary = pylsp_root_path .. "/bin/pylsp"
-- lspconfig.pylsp.setup {
--     cmd = {pylsp_binary},
--     cmd_env = {VIRTUAL_ENV = pylsp_root_path}
-- }
