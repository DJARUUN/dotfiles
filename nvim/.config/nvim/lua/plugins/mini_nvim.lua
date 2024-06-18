return {
	"echasnovski/mini.nvim",
	config = function()
		local move = require("mini.move")
		move.setup({})

		local surround = require("mini.surround")
		surround.setup({})

		local starter = require("mini.starter")
		starter.setup({
			query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
		})

		local sessions = require("mini.sessions")
		sessions.setup({
			autoread = false,
			autowrite = true,
			directory = ("%s%ssession"):format(vim.fn.stdpath("data"), "\\"),
			file = "session.vim",
		})

		local pairs = require("mini.pairs")
		pairs.setup({
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		})

		local indentscope = require("mini.indentscope")
		indentscope.setup({
			draw = {
				delay = 0,
				animation = indentscope.gen_animation.none(),
				priority = 2,
			},
			mappings = {
				object_scope = "ii",
				object_scope_with_border = "ai",
				goto_top = "[i",
				goto_bottom = "]i",
			},
			options = {
				border = "both",
				indent_at_cursor = false,
				try_as_border = true,
			},
			symbol = "│",
		})
	end,
}
