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
				max_height = "30%",
				highlights = {
					border = "FloatBorder",
				},
				border = "rounded",
			}))
		)
	end,
}
