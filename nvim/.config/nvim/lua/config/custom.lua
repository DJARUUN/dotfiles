local custom_dir = vim.fn.stdpath("config") .. "/lua/custom/"

-- load all lua files in 'custom' directory
for _, file in ipairs(vim.fn.globpath(custom_dir, "*.lua", false, true)) do
	local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
	require("custom." .. name) -- load the file
end
