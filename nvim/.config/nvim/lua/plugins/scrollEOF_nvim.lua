return {
	"Aasim-A/scrollEOF.nvim",
	event = { "CursorMoved", "WinScrolled" },
	config = function()
		require("scrollEOF").setup({})
	end,
}
