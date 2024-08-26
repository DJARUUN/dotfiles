vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch" })
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, { command = "lua Fix_italics()" })
