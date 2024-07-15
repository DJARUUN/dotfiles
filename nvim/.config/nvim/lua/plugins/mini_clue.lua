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
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },

				-- `s` key
				{ mode = "x", keys = "s" },
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
