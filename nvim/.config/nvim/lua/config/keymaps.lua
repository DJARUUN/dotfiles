local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap

map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages", silent = true })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list", silent = true })
map("n", "<leader>cs", vim.lsp.buf.hover, { desc = "Open LSP Hover information", silent = true })

map("n", "<leader>x", ":bd!<CR>", { desc = "Close current buffer", silent = true })
map("n", "<leader>X", ":bw!<CR>", { desc = "Wipeout current buffer", silent = true })

map("n", "<leader>t", ":terminal<CR>i", { desc = "Open terminal", silent = true })
map("t", "<esc><esc>", function()
	vim.api.nvim_command("stopinsert")
end)

map("n", "<tab>", ":bnext<CR>", { desc = "Next buffer", silent = true })
map("n", "<s-tab>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })

map("v", "Y", '"+y:lua print("Yanked to system clipboard")<CR>', { desc = "Yank to global clipboard", silent = true })
map(
	{ "n", "v" },
	"P",
	'"+p:lua print("Pasted from system clipboard")<CR>',
	{ desc = "Paste from global clipboard", silent = true }
)

map("n", "<leader><left>", ":wincmd h<cr>", { desc = "Move left", silent = true })
map("n", "<leader><down>", ":wincmd j<cr>", { desc = "Move down", silent = true })
map("n", "<leader><up>", ":wincmd k<cr>", { desc = "Move up", silent = true })
map("n", "<leader><right>", ":wincmd l<cr>", { desc = "Move right", silent = true })

map("n", "<leader>S", ':lua require("mini.starter").open()<cr>', { desc = "Open Starter", silent = true })

unmap("n", "gx")
unmap("x", "gx")
