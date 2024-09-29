vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch" })
	end,
})

vim.cmd([[highlight! link @lsp.type.variable.python function.method.call.python]])

vim.api.nvim_create_user_command("Daily", function(args)
	local today = os.date("%Y-%m-%d")
	vim.cmd([[e ~/notes/]] .. today .. [[.md]])
end, { desc = "Open daily note", nargs = "*" })

vim.cmd([[
	augroup HaskellFileType
		autocmd!
		autocmd FileType haskell set expandtab
	augroup END
]])
