local on_attach = function(client)
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
local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- local data_path = vim.fn.stdpath('data')
-- local lsp_server_internal_path = data_path .. '/lsp_servers'
-- local lspconfig = require'lspconfig'
--
-- -- Lua configuration
-- local sumneko_root_path = lsp_server_internal_path .. "/lua/lua-language-server"
-- local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
-- lspconfig.sumneko_lua.setup {
--     on_attach = on_attach,
--     cmd = {sumneko_binary, '-E', sumneko_root_path .. "/main.lua"},
--     settings = {
--         Lua = {
--             runtime = {
--                 version = 'LuaJIT',
--                 path = vim.split(package.path, ';')
--             },
--             diagnostics = {
--                 globals = {'vim'}
--             },
--             workspace = {
--                 library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] =true},
--                 maxPreload = 1000
--             }
--         }
--     }
-- }
-- -- -------------------------------------------------------------------------------
-- -- -- PYRIGHT LS
-- -- -------------------------------------------------------------------------------
-- -- local pyright_root_path = vim.env.HOME .. "/virtualenvs/editor"
-- -- local pyright_binary = pyright_root_path .. "/bin/pyright-langserver"
-- -- require'lspconfig'.pyright.setup {
-- --     on_attach = on_attach,
-- --     cmd = { pyright_binary, "--stdio" }
-- -- }
--
--
-- -------------------------------------------------------------------------------
-- -- PYLSP
-- -------------------------------------------------------------------------------
-- local pylsp_root_path = vim.env.HOME .. "/virtualenvs/editor"
-- local pylsp_binary = pylsp_root_path .. "/bin/pylsp"
-- lspconfig.pylsp.setup {
--     cmd = {pylsp_binary},
--     cmd_env = {VIRTUAL_ENV = pylsp_root_path}
-- }
