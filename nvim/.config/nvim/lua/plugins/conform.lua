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
		stop_after_first = true,
		formatters_by_ft = {
			lua = { "stylua" },
			ocaml = { "ocamlformat" },
			python = { "black" },
			fennel = { "fnlfmt" },
			php = { "pretty-php" },
		},
		formatters = {
			ocamlformat = {
				env = {
					OCAMLFORMAT = "profile=default,type-decl=sparse,module-item-spacing=preserve,break-infix=fit-or-vertical",
				},
			},
			-- php = {
			-- 	command = "php-cs-fixer",
			-- 	args = {
			-- 		"fix",
			-- 		"$FILENAME",
			-- 	},
			-- 	stdin = false,
			-- },
		},
	},
	init = function()
		vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
	end,
}
