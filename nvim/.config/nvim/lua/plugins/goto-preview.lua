return {
	"rmagatti/goto-preview",
	event = "BufEnter",
	config = function()
		require("goto-preview").setup({
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		})
	end,
}
