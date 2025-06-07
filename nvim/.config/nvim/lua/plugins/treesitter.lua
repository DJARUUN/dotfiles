local extra_parsers = {
	"gleam",
}

local custom_parsers = {}

return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	opts = {
		ensure_installed = extra_parsers,
		highlight = {
			enable = true,
		},
	},
	config = function(_, opts)
		-- needed to make ensure_installed work
		require("nvim-treesitter.configs").setup(opts)

		-- add custom parser configs
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		for parser, config in pairs(custom_parsers) do
			parser_config[parser] = config
		end
	end,
}
