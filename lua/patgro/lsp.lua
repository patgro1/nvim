local custom_attach = function(client)
  print("'" .. client.name .. "' language server started" );
end

local data_path = vim.fn.stdpath('data')
-------------------------------------------------------------------------------
-- LUA LS
-------------------------------------------------------------------------------
local sumneko_root_path = data_path .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    --on_attach = on_attach
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
local pyright_root_path = data_path .. "/lspinstall/python/"
local pyright_binary = pyright_root_path .. "node_modules/.bin/pyright-langserver"
require'lspconfig'.pyright.setup {
    cmd = { pyright_binary, "--stdio" }
}


-------------------------------------------------------------------------------
-- TYPESCRIPT LS
-------------------------------------------------------------------------------
local tsserver_root_path = data_path .. "/lspinstall/typescript/"
local bin_name = tsserver_root_path .. "node_modules/.bin/typescript-language-server"
require'lspconfig'.tsserver.setup {
    cmd = {bin_name, "--stdio"}
}



-------------------------------------------------------------------------------
-- DIAGNOSTIC LS
-------------------------------------------------------------------------------
vim.lsp.set_log_level("debug")
local diagls_root_path = data_path .. "/lspinstall/diagnosticls/"
local diagls_name = diagls_root_path .. "node_modules/.bin/diagnostic-languageserver"
require'lspconfig'.diagnosticls.setup {
    on_attach=custom_attach,
    cmd = {diagls_name, "--stdio", "--log-level", "4"},
    filetypes = { 'python' },
    init_options = {
        filetypes = {
            python = { "flake8" },
        },
        linters = {
            flake8 = {
                debounce = 100,
                sourceName = "flake8",
                command = "flake8",
                args = { "--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s", "-" },
                formatPattern = {
                    "(\\d+),(\\d+),([A-Z]),(.*)(\\r|\\n)*$",
                    {
                        line = 1,
                        column = 2,
                        security = 3,
                        message = 4,
                    },
                },
                securities = {
                    W = "warning",
                    E = "error",
                    F = "error",
                    C = "error",
                    N = "error",
                },
            },
        }
    }
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
lspconfig.sv_lsp.setup{}


