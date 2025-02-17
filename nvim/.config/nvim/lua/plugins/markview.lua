return {
	enabled = false,
	"OXY2DEV/markview.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("markview").setup({
			file_types = { "markdown", "telekasten" },
			preview = {
				modes = { "n", "i", "no", "c" },
				hybrid_modes = { "i" },
				callbacks = {
					on_enable = function(_, win)
						vim.wo[win].conceallevel = 2
						vim.wo[win].concealcursor = "nc"
					end,
				},
			}
		})

		vim.cmd("Markview enable")
	end,
}
