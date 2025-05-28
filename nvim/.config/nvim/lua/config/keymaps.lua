-- stylua: ignore start
local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap

-- lsp

map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages", silent = true })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list", silent = true })
map("n", "<leader>cs", vim.lsp.buf.hover, { desc = "Open LSP Hover information", silent = true })

map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", silent = true })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions", silent = true })

map("n", "gd", function() require("fzf-lua").lsp_definitions() end, { desc = "Goto Definition", silent = true })
map("n", "gr", function() require("fzf-lua").lsp_references() end, { desc = "Goto References", silent = true })
map("n", "gI", function() require("fzf-lua").lsp_implementations() end, { desc = "Goto Implementation", silent = true })
map("n", "<leader>ds", function() require("fzf-lua").lsp_document_symbols() end, { desc = "Document Symbols", silent = true })
map("n", "<leader>ws", function() require("fzf-lua").lsp_workspace_symbols() end, { desc = "Workspace Symbols", silent = true })

-- terminal

map("n", "<leader>t", ":terminal<CR>i", { desc = "Open terminal", silent = true })
map("t", "<esc><esc>", function()
	vim.api.nvim_command("stopinsert")
end)

-- buffers

map("n", "<tab>", ":bnext<CR>", { desc = "Next buffer", silent = true })
map("n", "<s-tab>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })

map("n", "<leader>x", ":bd!<CR>", { desc = "Close current buffer", silent = true })

map("n", "<C-S-Left>", ":vertical resize +5<CR>", { silent = true })
map("n", "<C-S-Right>", ":vertical resize -5<CR>", { silent = true })

-- yank/paste

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

-- move

map("n", "<M-DOWN>", ":m+<CR>", { silent = true }) -- move line down
map("n", "<M-UP>", ":m-2<CR>", { silent = true }) -- move line up
map("x", "<M-DOWN>", ":m '>+1<CR>gv=gv", { silent = true }) -- move code block down
map("x", "<M-UP>", ":m '<-2<CR>gv=gv", { silent = true }) -- move code block up

-- misc

map("n", "<leader>S", ':lua require("mini.starter").open()<cr>', { desc = "Open Starter", silent = true })
unmap("n", "gx")
unmap("x", "gx")

map({ "n", "v" }, "<c-e>", "<c-u>")
-- stylua: ignore end
