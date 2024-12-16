return {
	"saghen/blink.cmp",
	lazy = false,
	version = "v0.*",
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},
	},

	config = function()
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		require("blink-cmp").setup({
			keymap = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},

			completion = {
				trigger = {
					show_on_accept_on_trigger_character = false,
					show_on_insert_on_trigger_character = false,
				},

				menu = {
					scrollbar = false,
					treesitter = { "lsp" },

					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					update_delay_ms = 0,
				},
			},

			signature = {
				enabled = true,
			},

			sources = {
				default = { "lsp", "path", "luasnip", "buffer" },
			},
		})
	end,

	opts_extend = { "sources.default" },
}
