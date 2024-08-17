return {
	"echasnovski/mini.files",
	lazy = false,
	config = function()
		local files = require("mini.files")

		files.setup({
			content = {
				filter = nil,
				prefix = nil,
				sort = nil,
			},

			mappings = {
				close = "<esc>",
				go_in = "<s-right>",
				go_in_plus = "<right>",
				go_out = "<s-left>",
				go_out_plus = "<left>",
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
				max_number = 4,
				preview = true,
				width_focus = math.floor(vim.o.columns * (5 / 24)) - 1,
				width_nofocus = math.floor(vim.o.columns * (5 / 24)) - 1,
				width_preview = math.floor(vim.o.columns * (3 / 8)) - 3,
			},
		})

		vim.cmd([[highlight link MiniFilesCursorLine CursorLine]])
		vim.cmd([[highlight link MiniFilesNormal Normal]])
		vim.cmd([[highlight MiniFilesNormal guibg=NONE]])
		vim.cmd([[highlight link MiniFilesTitle Normal]])
		vim.cmd([[highlight link MiniFilesTitleFocused Normal]])
		vim.cmd([[highlight MiniFilesBorderModified guibg=#242832 guifg=#c678dd]])
	end,
	keys = {
		{
			"-",
			mode = "n",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0))
			end,
			desc = "Open Mini Files",
		},
		{
			"<leader>-",
			mode = "n",
			function()
				require("mini.files").open(nil, false)
			end,
			desc = "Open Mini Files in CWD",
		},
		{
			[[g\]],
			mode = "n",
			function()
				require("mini.files").open(vim.fn.stdpath("data") .. "/mini.files/trash")
			end,
			desc = "Open Mini Files in Trash",
		},
	},
}
