return {
	"echasnovski/mini.sessions",
	opts = {
		autoread = false,
		autowrite = true,
		directory = ("%s%ssession"):format(vim.fn.stdpath("data"), "\\"),
		file = "session.vim",
	},
}
