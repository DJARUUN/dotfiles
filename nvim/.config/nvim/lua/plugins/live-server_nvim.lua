return {
	"aurum77/live-server.nvim",
	event = "VeryLazy",
	run = function()
		require("live_server.util").install()
	end,
	cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
}
