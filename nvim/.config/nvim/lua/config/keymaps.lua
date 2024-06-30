local M = {}

function M.run()
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
	vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
	vim.keymap.set("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })
	vim.keymap.set("n", "<leader>cs", vim.lsp.buf.hover, { desc = "Open LSP Hover information" })

	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	vim.keymap.set("n", "<leader>x", ":bd!<CR>", { desc = "Close current buffer" })
	vim.keymap.set("n", "<leader>X", ":bw!<CR>", { desc = "Wipeout current buffer" })

	vim.keymap.set("n", "<leader>rr", function()
		return ":IncRename " .. vim.fn.expand("<dword>")
	end, { desc = "Incremental rename", expr = true })

	vim.keymap.set(
		"n",
		"gp",
		"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
		{ noremap = true, desc = "Go to preview" }
	)

	vim.keymap.set("n", "<leader>t", ":terminal<CR>i", { desc = "Open terminal" })
	vim.keymap.set("t", "<esc><esc>", function()
		vim.api.nvim_command("stopinsert")
	end)

	vim.keymap.set("n", "<leader>-", ":Oil<CR>", { desc = "Open Oil" })

	vim.keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
	vim.keymap.set("n", "<s-tab>", ":bprevious<CR>", { desc = "Previous buffer" })

	vim.keymap.set("v", "Y", '"+y:lua print("Yanked to system clipboard")<CR>', { desc = "Yank to global clipboard" })
	vim.keymap.set(
		{ "n", "v" },
		"P",
		'"+p:lua print("Pasted from system clipboard")<CR>',
		{ desc = "Paste from global clipboard" }
	)

	vim.keymap.set("n", "<leader>st", ":MC<CR>", { desc = "Search Tasks" })
end

return M
