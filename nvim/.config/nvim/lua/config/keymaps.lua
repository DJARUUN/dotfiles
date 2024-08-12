local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })
map("n", "<leader>cs", vim.lsp.buf.hover, { desc = "Open LSP Hover information" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>x", ":bd!<CR>", { desc = "Close current buffer" })
map("n", "<leader>X", ":bw!<CR>", { desc = "Wipeout current buffer" })

map("n", "<leader>rr", function()
	return ":IncRename " .. vim.fn.expand("<dword>")
end, { desc = "Incremental rename", expr = true })

map(
	"n",
	"gp",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true, desc = "Go to preview" }
)

map("n", "<leader>t", ":terminal<CR>i", { desc = "Open terminal" })
map("t", "<esc><esc>", function()
	vim.api.nvim_command("stopinsert")
end)

map("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<s-tab>", ":bprevious<CR>", { desc = "Previous buffer" })

map("v", "Y", '"+y:lua print("Yanked to system clipboard")<CR>', { desc = "Yank to global clipboard" })
map({ "n", "v" }, "P", '"+p:lua print("Pasted from system clipboard")<CR>', { desc = "Paste from global clipboard" })

map("n", "<leader><left>", ":wincmd h<cr>", { desc = "Move left", silent = true })
map("n", "<leader><down>", ":wincmd j<cr>", { desc = "Move down", silent = true })
map("n", "<leader><up>", ":wincmd k<cr>", { desc = "Move up", silent = true })
map("n", "<leader><right>", ":wincmd l<cr>", { desc = "Move right", silent = true })

map("n", "<leader>S", ':lua require("mini.starter").open()<cr>', { desc = "Open Starter", silent = true })

unmap("n", "gx")
unmap("x", "gx")
