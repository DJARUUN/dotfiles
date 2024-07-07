return {
	"smjonas/inc-rename.nvim",
	event = "BufEnter",
	config = function()
		---@diagnostic disable: missing-fields
		require("inc_rename").setup({})
	end,
}
