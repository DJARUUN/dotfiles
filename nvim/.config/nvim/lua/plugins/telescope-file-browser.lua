return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	keys = {
		{
			-- open in current file dir
			"-",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			desc = "Open File Browser",
			mode = { "n", "v" },
		},
		{
			-- open in cwd
			"<leader>-",
			":Telescope file_browser<CR>",
			desc = "Open File Browser in CWD",
			mode = { "n", "v" },
		},
	},
}
