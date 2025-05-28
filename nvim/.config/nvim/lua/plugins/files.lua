local function open_cwd()
	require("mini.files").open()
end

local function open_local()
	local files = require("mini.files")
	local _, success = pcall(files.open, vim.api.nvim_buf_get_name(0))

	-- open cwd if it failed for some reason, like opening inside of a buffer that is not a file buffer like mini.starter
	if success ~= nil then
		open_cwd()
	end
end

return {
	"echasnovski/mini.files",
	opts = {
		mappings = {
			close = "<ESC>",
			go_in = "<RIGHT>",
			go_in_plus = "<CR>",
			go_out = "<LEFT>",
			go_out_plus = "<S-LEFT>",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
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
		{ "-", open_local, { silent = true } }, -- Open directory of current file (in last used state) focused on the file
		{ "<leader>-", open_cwd, { silent = true } }, -- Fresh explorer in current working directory
	},
}
