return {
	"ojroques/nvim-hardline",
	config = function()
		require("hardline").setup({
			bufferline = false,
			bufferline_settings = {},
			sections = {
				"[",
				{ class = "mode", item = require("hardline.parts.mode").get_item },
				"]",
				{ class = "high", item = require("hardline.parts.git").get_item, hide = 100 },
				{ class = "med", item = require("hardline.parts.filename").get_item },
				">",
				{ class = "med", item = require("hardline.parts.cwd").get_item },
				">",
				{ class = "med", item = "%=" },
				"<",
				{ class = "high", item = require("hardline.parts.filetype").get_item, hide = 60 },
				"|",
				{ class = "mode", item = require("hardline.parts.line").get_item },
				">",
			},
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.cmd([[highlight clear Hardline_bufferline_current_modified]])
				vim.cmd([[highlight clear Hardline_bufferline_separator]])
				vim.cmd([[highlight clear Hardline_bufferline_current]])
				-- vim.cmd([[highlight Hardline_bufferline_background_modified guifg=#707a8c guibg=#232933]])
				-- vim.cmd([[highlight Hardline_bufferline_background guifg=#707a8c guibg=#232933]])
				vim.cmd([[highlight clear Hardline_bufferline_background_modified]])
				vim.cmd([[highlight clear Hardline_bufferline_background]])

				vim.cmd([[highlight clear Hardline_warning_inactive]])
				vim.cmd([[highlight clear Hardline_warning_active]])

				vim.cmd([[highlight clear Hardline_error_inactive]])
				vim.cmd([[highlight clear Hardline_error_active]])

				vim.cmd([[highlight clear Hardline_mode_inactive]])
				vim.cmd([[highlight clear Hardline_mode_replace]])
				vim.cmd([[highlight clear Hardline_mode_command]])
				vim.cmd([[highlight clear Hardline_mode_visual]])
				vim.cmd([[highlight clear Hardline_mode_normal]])
				vim.cmd([[highlight clear Hardline_mode_insert]])

				vim.cmd([[highlight clear Hardline_high_inactive]])
				vim.cmd([[highlight clear Hardline_high_active]])

				vim.cmd([[highlight clear Hardline_med_inactive]])
				vim.cmd([[highlight clear Hardline_med_active]])

				vim.cmd([[highlight clear Hardline_low_inactive]])
				vim.cmd([[highlight clear Hardline_low_active]])
			end,
		})
	end,
}
