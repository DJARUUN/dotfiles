return {
	"yashguptaz/calvera-dark.nvim",
	"olivercederborg/poimandres.nvim",
	"https://gitlab.com/wmwnuk/kyotonight-vim",
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "cool",
				transparent = false,
				term_colors = true,
				ending_tildes = false,
				cmp_itemkind_reverse = false,

				toggle_style_key = nil,
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },

				code_style = {
					comments = "italic",
					keywords = "italic",
					functions = "italic",
					strings = "none",
					variables = "none",
				},

				colors = {},
				highlights = {},

				diagnostics = {
					darker = true,
					undercurl = true,
					background = true,
				},
			})
		end,
	},
	{
		"rafamadriz/neon",
		config = function()
			vim.g.neon_style = "dark"
		end,
	},
}
