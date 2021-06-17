-- LSP Saga configuration
local saga = require 'lspsaga'
saga.init_lsp_saga()
-- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

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
local pyright_root_path = data_path .. "lspinstall/python/"
local pyright_binary = pyright_root_path .. "node_modules/.bin/pyright-langserver"
require'lspconfig'.pyright.setup {
    cmd = { pyright_binary, "--stdio" }
}


-------------------------------------------------------------------------------
-- TYPESCRIPT LS
-------------------------------------------------------------------------------
local tsserver_root_path = data_path .. "lspinstall/typescript/"

local bin_name = tsserver_root_path .. "node_modules/.bin/typescript-language-server"

require'lspconfig'.tsserver.setup {
    cmd = {bin_name, "--stdio"}
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


-------------------------------------------------------------------------------
-- COMPE
-------------------------------------------------------------------------------
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
    -- ultinisnips = true;
  };
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    end
    return false
end

-- Use (s-)tab to navigate completion menu or snupper placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
