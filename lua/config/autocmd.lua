vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_augroup("quickfix", { clear = false })
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
	group = "quickfix",
	pattern = "[^l]*",
	command = "cwindow",
})
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
	group = "quickfix",
	pattern = "l*",
	command = "lwindow",
})
