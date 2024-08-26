return {
	"echasnovski/mini.clue",
	config = function()
		local clue = require("mini.clue")

		clue.setup({
			window = {
				delay = 200,
				config = {
					anchor = "SW",
					width = "auto",
					row = "auto",
					col = "auto",
				},
			},

			triggers = {
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				{ mode = "i", keys = "<C-x>" },

				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				{ mode = "n", keys = "<C-w>" },

				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },

				{ mode = "n", keys = "[" },
				{ mode = "x", keys = "[" },
			},

			clues = {
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows(),
				clue.gen_clues.z(),

				-- Mapping groups
				{ mode = "n", keys = "<Leader>c", desc = "+Code" },
				{ mode = "n", keys = "<Leader>d", desc = "+Document" },
				{ mode = "x", keys = "<Leader>d", desc = "+Document" },
				{ mode = "n", keys = "<Leader>r", desc = "+Rename" },
				{ mode = "n", keys = "<Leader>s", desc = "+Search" },
				{ mode = "x", keys = "<Leader>s", desc = "+Search" },
				{ mode = "n", keys = "<Leader>w", desc = "+Workspace" },
				{ mode = "n", keys = "<Leader>m", desc = "+Minimap" },
			},
		})
	end,
}
