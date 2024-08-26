return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	opts = {
		float_diff = false,
		window = {
			winblend = 0,
		},
		layout = "left_left_bottom",
		keymaps = {
			["j"] = "move_next",
			["<DOWN>"] = "move_next",
			["k"] = "move_prev",
			["<UP>"] = "move_prev",
			["gj"] = "move2parent",
			["J"] = "move_change_next",
			["K"] = "move_change_prev",
			["<CR>"] = "action_enter",
			["p"] = "enter_diffbuf",
			["q"] = "quit",
		},
	},
	keys = {
		{ "<leader>su", "<cmd>lua require('undotree').toggle()<cr>", desc = "Show undo tree" },
	},
}
