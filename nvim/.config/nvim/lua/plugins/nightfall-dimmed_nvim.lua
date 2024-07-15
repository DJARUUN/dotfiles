return {
	"https://gitlab.com/djaruun/nightfall-dimmed.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme nightfall_dimmed]])
	end,
}
