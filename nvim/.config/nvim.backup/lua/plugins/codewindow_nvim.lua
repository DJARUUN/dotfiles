return {
	"gorbit99/codewindow.nvim",
	config = function()
		local codewindow = require("codewindow")
		codewindow.setup({
			auto_enable = true,
			exclude_filetypes = { "oil", "starter", "help", "ministarter" },
			window_border = "none",
			show_cursor = false,
			screen_bounds = "background",
			minimap_width = 12,
		})
		codewindow.apply_default_keybinds()
	end,
}
