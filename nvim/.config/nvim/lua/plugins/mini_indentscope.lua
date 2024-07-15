return {
	"echasnovski/mini.indentscope",
	config = function()
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
