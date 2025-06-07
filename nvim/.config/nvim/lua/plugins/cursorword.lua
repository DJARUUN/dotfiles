return {
	"echasnovski/mini.cursorword",
	config = function()
		require("mini.cursorword").setup()

		-- vim.cmd([[highlight! MiniCursorword guibg=#363738 cterm=NONE gui=NONE]])
	end,
}
