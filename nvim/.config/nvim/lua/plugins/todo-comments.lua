return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
	opts = {},
	keys = {
		{
			"<leader>st",
			":TodoFzfLua<CR>",
			{ silent = true },
		},
	},
}
