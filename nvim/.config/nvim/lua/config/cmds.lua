vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "CurSearch" })
	end,
})

vim.cmd([[
	augroup HaskellFileType
		autocmd!
		autocmd FileType haskell set expandtab
	augroup END
]])
