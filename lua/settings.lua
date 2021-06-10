vim.g.mapleader = ' '
-- Terminal coloring and custom settings
vim.o.termguicolors = true
--vim.o.t_Co = "256"

-- Want to preview effect of command in the window
vim.o.inccommand = "nosplit"

-- Mouse interaction.. I prefer always using the keyboard but its a nice to have when
-- not actively typing.
vim.o.mouse = "a"

-- Tab and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.bo.smartindent = true

-- Line numbers should be always active
vim.wo.number = true
vim.wo.relativenumber = true

-- Show the sign column all the time
vim.wo.signcolumn = "yes"

-- Status line configuration
vim.o.showmode = false

-- Clipboard opened to the world
vim.o.clipboard = "unnamedplus"

-- Misc
vim.o.hidden = true
vim.o.backup = false -- No need for backup files for modern computers
vim.wo.wrap = false
vim.o.writebackup = false
