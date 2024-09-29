return {
	"hiphish/rainbow-delimiters.nvim",
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				"MiniIconsYellow",
				"MiniIconsPurple",
				"MiniIconsGreen",
				"@function.builtin",
				"MiniIconsCyan",
				"MiniIconsRed",
				"MiniIconsGrey",
			},
		})
	end,
}
