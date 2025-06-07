return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			require("onedarkpro").setup({
				styles = {
					comments = "italic",
				},
				options = {
					transparency = true,
				},
			})
			vim.cmd.colorscheme("onedark_dark")
		end,
	},
}
