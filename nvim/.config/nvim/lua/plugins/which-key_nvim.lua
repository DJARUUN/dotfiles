return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local which_key = require("which-key")

		which_key.setup({
			window = {
				border = "rounded",
			},
			icons = {
				breadcrumb = "»",
				separator = "->",
				group = "+",
			},
		})

		which_key.register({
			["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
			["<leader>d"] = { name = "Document", _ = "which_key_ignore" },
			["<leader>r"] = { name = "Rename", _ = "which_key_ignore" },
			["<leader>s"] = { name = "Search", _ = "which_key_ignore" },
			["<leader>w"] = { name = "Workspace", _ = "which_key_ignore" },
			["<leader>h"] = { name = "Git Hunk", _ = "which_key_ignore" },
			["<leader>cm"] = { name = "CMake", _ = "which_key_ignore" },
		})

		which_key.register({
			["<leader>h"] = { name = "Git Hunk", _ = "which_key_ignore" },
		})
	end,
}
