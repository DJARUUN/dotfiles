local custom_dir = vim.fn.stdpath("config") .. "/lua/custom/"

-- load all lua files in 'custom' directory
for _, file in ipairs(vim.fn.globpath(custom_dir, "*.lua", false, true)) do
	local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension

	local f = io.open(file, "r")
	local first_line = f and f:read("*l") or ""
	if f then
		f:close()
	end
	-- Only include the file if it doesn't start with "-- disable"
	if not first_line:match("^%-%- disable") then
		require("custom." .. name) -- load the file
	end
end
