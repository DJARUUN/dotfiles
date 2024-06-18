return {
	"nvim-treesitter/nvim-treesitter-refactor",
	config = function()
		local configs = require("nvim-treesitter.configs")
		---@diagnostic disable: missing-fields
		configs.setup({
			refactor = {
				highlight_definitions = {
					enabled = true,
					clear_on_cursor_move = true,
				},
				highlight_current_scope = {
					enabled = true,
				},
				smart_rename = {
					enable = true,
					keymaps = {
						smart_rename = "grr",
					},
				},
			},
		})
	end,
}
