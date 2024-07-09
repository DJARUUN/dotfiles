return {
	"ojroques/nvim-hardline",
	config = function()
		require("hardline").setup({
			bufferline = true,
			bufferline_settings = {},
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
		})
	end,
}
