return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	config = function()
		require("blink.cmp").setup({
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
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
									return kind_icon
								end,
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
						},
						treesitter = { "lsp" },
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
			cmdline = {
				enabled = false,
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})

		vim.cmd([[highlight! link BlinkCmpMenu BlinkCmpDoc]])
		vim.cmd([[highlight! link BlinkCmpMenuBorder BlinkCmpDocBorder]])
		vim.cmd([[highlight! link BlinkCmpMenuSelection BlinkCmpDocCursorLine]])
	end,
	opts_extend = { "sources.default" },
}
