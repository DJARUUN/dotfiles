return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		formatters_by_ft = {
			lua = { "stylua" },
			ocaml = { "ocamlformat" },
		},
		formatters = {
			ocamlformat = {
				env = {
					OCAMLFORMAT = "profile=default",
				},
			},
		},
	},
	init = function()
		vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
	end,
}
