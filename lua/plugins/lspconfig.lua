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

local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
  "lua",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
    local opts = {on_attach=on_attach}
    server:setup(opts)
end)
