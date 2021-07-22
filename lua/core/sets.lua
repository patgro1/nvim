vim.g.mapleader = ' '
vim.o.termguicolors = true
vim.o.guicursor=''


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

-- Show the sign column all the time
vim.wo.signcolumn = "yes"

-- Clipboard opened to the world
vim.o.clipboard = "unnamedplus"

-- This prevents the cursor to read completely down when moving the buffer up or down
vim.wo.scrolloff = 8

-- Misc
vim.o.hidden = true
vim.o.swapfile = false
vim.o.backup = false -- No need for backup files for modern computers
vim.wo.wrap = false
vim.o.writebackup = false

vim.wo.colorcolumn = '120'

-- Setting python virtualenvironment
vim.g.python3_host_prog = '~/virtualenvs/nvim/bin/python'
