return {
	"gelguy/wilder.nvim",
	config = function()
		local wilder = require("wilder")

		wilder.setup({ modes = { ":", "/", "?" } })
		wilder.set_option("use_python_remote_plugin", 0)

		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					fuzzy = 1,
					fuzzy_filter = wilder.lua_fzy_filter(),
				}),
				wilder.vim_search_pipeline()
			),
		})

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				highlights = {
					border = "FloatBorder",
				},
				left = { " ", wilder.popupmenu_devicons() },
				right = { " " },
				max_height = "30%",
				border = "rounded",
			}))
		)
	end,
}
