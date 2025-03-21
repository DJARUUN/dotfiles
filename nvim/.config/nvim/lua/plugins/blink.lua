return {
	"saghen/blink.cmp",
	lazy = false,
	version = "v0.*",
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},

	opts = {
		keymap = {
			preset = "none",

			["<Up>"] = {},
			["<Down>"] = {},
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-space>"] = { "show" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			trigger = {
				show_on_accept_on_trigger_character = false,
				show_on_insert_on_trigger_character = false,
			},

			menu = {
				scrollbar = false,
				-- treesitter = { "lsp" },

				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- Optionally, you may also use the highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				update_delay_ms = 50,
				treesitter_highlighting = true,
			},
		},

		signature = {
			enabled = true,
		},

		snippets = { preset = "luasnip" },

		cmdline = {
			sources = {},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
