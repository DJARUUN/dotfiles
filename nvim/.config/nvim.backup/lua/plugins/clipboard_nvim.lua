return {
	"https://gitlab.com/djaruun/clipboard.nvim.git",
	-- dir = "~/p/nvim/clipboard.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>sc",
			function()
				require("clipboard").open_clipboard()
			end,
			desc = "Open clipboard",
			mode = { "n", "v" },
		},
	},
}
