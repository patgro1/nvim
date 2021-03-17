local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Tab and indentation
o.shiftwidth=4
o.tabstop=4
o.expandtab=true
o.smarttab=true

-- Line numbering
wo.number=true
wo.relativenumber=true

_G.toggle_relative_numbers = function()
    if not wo.relativenumber then
        wo.relativenumber=true
    else
        wo.relativenumber=false
    end
end

vim.api.nvim_set_keymap('n', '<Leader>ln', "v:lua.toggle_relative_numbers()", {expr=true})
