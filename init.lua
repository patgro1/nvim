-- Bootstrapping Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Loading remaps (containing mapleader, it need to be done before lazy is setup
require "pat.remaps"
require "pat.options"
require "pat.autocommands"

-- Setting up Lazy with plugins spec path
require("lazy").setup("plugins")
