return {
	"2KAbhishek/nerdy.nvim",
	event = "BufEnter",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	cmd = "Nerdy",
	config = function()
		require("telescope").load_extension("nerdy")
	end,
}
