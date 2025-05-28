local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap

map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages", silent = true })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list", silent = true })
map("n", "<leader>cs", vim.lsp.buf.hover, { desc = "Open LSP Hover information", silent = true })

map("n", "<leader>t", ":terminal<CR>i", { desc = "Open terminal", silent = true })
map("t", "<esc><esc>", function()
	vim.api.nvim_command("stopinsert")
end)

map("n", "<tab>", ":bnext<CR>", { desc = "Next buffer", silent = true })
map("n", "<s-tab>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })

map(
	"v",
	"<leader>y",
	'"+y:lua print("Yanked to system clipboard")<CR>',
	{ desc = "Yank to global clipboard", silent = true }
)
map(
	{ "n", "v" },
	"<leader>p",
	'"+p:lua print("Pasted from system clipboard")<CR>',
	{ desc = "Paste from global clipboard", silent = true }
)

map("n", "<leader>S", ':lua require("mini.starter").open()<cr>', { desc = "Open Starter", silent = true })

unmap("n", "gx")
unmap("x", "gx")

map("n", "<C-S-Left>", ":vertical resize +5<CR>", { silent = true })
map("n", "<C-S-Right>", ":vertical resize -5<CR>", { silent = true })

map({ "n", "v" }, "<c-e>", "<c-u>")

map("n", "<M-DOWN>", ":m+<CR>", { silent = true }) -- move line down
map("n", "<M-UP>", ":m-2<CR>", { silent = true }) -- move line up
map("x", "<M-DOWN>", ":m '>+1<CR>gv=gv", { silent = true }) -- move code block down
map("x", "<M-UP>", ":m '<-2<CR>gv=gv", { silent = true }) -- move code block up
