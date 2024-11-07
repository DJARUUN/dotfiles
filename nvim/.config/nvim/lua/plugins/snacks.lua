return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		win = { enabled = false },
		toggle = { enabled = false },
		lazygit = { enabled = false },
		terminal = { enabled = false },
		statuscolumn = { enabled = false },
		notifier = { enabled = false },

		bigfile = { enabled = true },
		gitbrowse = { enabled = true },
		quickfile = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>x",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
		},
		{
			"<leader>N",
			desc = "Neovim News",
			":edit " .. vim.api.nvim_get_runtime_file("doc/news.txt", false)[1] .. "<cr>",
		},
	},
}
