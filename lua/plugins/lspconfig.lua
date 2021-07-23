local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = {noremap = true, silent = true}
    -- LSP Mappings
    buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>gfr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>cc', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>cr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>hh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>hs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

local data_path = vim.fn.stdpath('data')
-------------------------------------------------------------------------------
-- LUA LS
-------------------------------------------------------------------------------
local sumneko_root_path = data_path .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = on_attach,
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
-- local pyright_root_path = data_path .. "/lspinstall/python/"
-- local pyright_binary = pyright_root_path .. "node_modules/.bin/pyright-langserver"
-- require'lspconfig'.pyright.setup {
--     cmd = { pyright_binary, "--stdio" }
-- }

-------------------------------------------------------------------------------
-- python-lsp-server
-------------------------------------------------------------------------------
require'lspconfig'.pylsp.setup{
    on_attach = on_attach,
}

-------------------------------------------------------------------------------
-- TYPESCRIPT LS
-------------------------------------------------------------------------------
local tsserver_root_path = data_path .. "/lspinstall/typescript/"
local bin_name = tsserver_root_path .. "node_modules/.bin/typescript-language-server"
require'lspconfig'.tsserver.setup {
    cmd = {bin_name, "--stdio"},
    on_attach = on_attach,
}

-------------------------------------------------------------------------------
-- SV LS
-------------------------------------------------------------------------------
local lspconfig =  require'lspconfig'
local configs = require'lspconfig/configs'

if not lspconfig.sv_lsp then
    configs.sv_lsp = {
        default_config = {
            cmd = {"node", "/home/pgrogan/workspace/svlangserver/lib/svlangserver.js", "--stdio"};
            filetypes = {'systemverilog'};
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_home_dir()
            end;
            settings = {};
        };
    }
end
lspconfig.sv_lsp.setup{
    on_attach = on_attach,
}
