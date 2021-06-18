-- LSP Saga configuration
local saga = require 'lspsaga'
saga.init_lsp_saga()
-- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

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


-------------------------------------------------------------------------------
-- Nothing to do with LSP but that was the best place to put it I think
-------------------------------------------------------------------------------
local colors = require("material.colors")
require("todo-comments").setup {
    -- TODO: create todo hl
    -- FIX: fix the fixme hl
    -- NOTE: this is not the proper highlight
    -- HACK: should hack this comment
    signs = true,
    keywords = {
        FIX = {
            color = colors.red,
            icon = '',
            alt = {'FIXME', 'BUG'}
        },
        TODO = {
            color = colors.green,
            icon = ''
        },
        WARN = {
            color = colors.yellow,
            icon = '',
            alt = {'WARNING'}
        },
        HACK = {
            color = colors.orange,
            icon = ''
        },
        INFO = {
            color = colors.blue,
            icon = '',
            alt = {'NOTE'}
        },
    },
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
    },
    pattern = "(KEYWORDS):",
}
