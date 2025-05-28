local lsp_files = {}
local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"

for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
	-- Read the first line of the file
	local f = io.open(file, "r")
	local first_line = f and f:read("*l") or ""
	if f then
		f:close()
	end
	-- Only include the file if it doesn"t start with "-- disable"
	if not first_line:match("^%-%- disable") then
		local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
		table.insert(lsp_files, name)
	end
end

vim.lsp.enable(lsp_files)

print("Registered and enabled LSPs: " .. table.concat(lsp_files, ", "))

-- utils for working with the clients

-- vim.api.nvim_create_user_command("LspInfo")
-- vim.api.nvim_create_user_command("LspLog", function)
-- vim.api.nvim_create_user_command("LspRestart")
-- vim.api.nvim_create_user_command("LspStart")
-- vim.api.nvim_create_user_command("LspStop")
