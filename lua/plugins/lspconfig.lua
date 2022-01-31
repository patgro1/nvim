local wk = require("which-key")
local on_attach = function(client, bufnr)
    -- LSP Mappings
    wk.register({
        l = {
            name = "LSP",
            g = {
                name = "Goto",
                d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Definition'},
                D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration'},
                i = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation'},
            },
            f = {
                name = 'Find',
                r =  {'<Cmd>lua vim.lsp.buf.references()<CR>', 'References'}
            },
            c = {
                name = "Code action",
                c = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Menu' },
                r = { '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
            },
            h = {
                name = 'Documentation',
                h = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover doc'},
                s = { '<Cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help'}
            },
        },
    }, {prefix = '<leader>'})
    -- buf_set_keymap('n', '<leader>hh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', '<leader>hs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts) ]]
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
