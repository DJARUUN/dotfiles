return {
	"ojroques/nvim-hardline",
	config = function()
		require("hardline").setup({
			bufferline = true,
			bufferline_settings = {},
			theme = "default",
			sections = {
				"[",
				{ class = "mode", item = require("hardline.parts.mode").get_item },
				"]",
				{ class = "high", item = require("hardline.parts.git").get_item, hide = 100 },
				{ class = "med", item = require("hardline.parts.filename").get_item },
				">",
				{ class = "med", item = require("hardline.parts.cwd").get_item },
				">",
				{ class = "med", item = "%=" },
				"<",
				{ class = "high", item = require("hardline.parts.filetype").get_item, hide = 60 },
				"|",
				{ class = "mode", item = require("hardline.parts.line").get_item },
				">",
			},

			custom_theme = {
				text = { gui = "NONE" },
				normal = { gui = "NONE" },
				insert = { gui = "NONE" },
				replace = { gui = "NONE" },
				inactive_comment = { gui = "NONE" },
				inactive_cursor = { gui = "NONE" },
				inactive_menu = { gui = "NONE" },
				visual = { gui = "NONE" },
				command = { gui = "NONE" },
				alt_text = { gui = "NONE" },
				warning = { gui = "NONE" },
			},
		})
	end,
}
