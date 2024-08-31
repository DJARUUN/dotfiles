return {
	"mikavilpas/yazi.nvim",
	event = "User",
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
	keys = {
		{
			"-",
			mode = "n",
			":e .<cr>",
			desc = "Open Yazi",
		},
		{
			"<leader>-",
			mode = "n",
			":Yazi cwd<cr>",
			desc = "Open Yazi in CWD",
		},
	},
}
