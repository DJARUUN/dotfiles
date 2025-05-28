return {
	"echasnovski/mini.files",
	opts = {
		mappings = {
			close = "<ESC>",
			go_in = "<RIGHT>",
			go_in_plus = "<CR>",
			go_out = "<LEFT>",
			go_out_plus = "<S-LEFT>",
			mark_goto   = "'",
			mark_set    = "m",
			reset       = "<BS>",
			reveal_cwd  = "@",
			show_help   = "g?",
			synchronize = "=",
			trim_left   = "<",
			trim_right  = ">",
		},
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
    windows = {
      preview = true,
      width_preview = 100,
    },
	},
	keys = {
		{ "-", function() require("mini.files").open() end, { silent = true } },
		{ "<leader>-", function() require("mini.files").open() end, { silent = true } },
	},
}
