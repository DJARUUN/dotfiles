return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		-- {
		-- 	"<leader>f",
		-- 	function()
		-- 		require("conform").format({ async = true, lsp_fallback = true })
		-- 	end,
		-- 	mode = "",
		-- 	desc = "Format buffer",
		-- },
	},
	config = function()
		require("conform").setup({
			notify_on_error = false,

			default_format_opts = {
				lsp_format = "fallback",
			},

			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					lsp_format = "fallback",
					timeout_ms = 500,
				}
			end,

			format_after_save = {
				lsp_format = "fallback",
			},

			stop_after_first = true,
			formatters_by_ft = {
				lua = { "stylua" },
				ocaml = { "ocamlformat" },
				python = { "black" },
				fennel = { "fnlfmt" },
				php = { "pretty-php" },
				javascript = { "prettier", "ts_ls" },
				typescript = { "prettier", "ts_ls" },
				javascriptreact = { "prettier", "ts_ls" },
				typescriptreact = { "prettier", "ts_ls" },
				blade = { "blade-formatter" },
				ruby = { "rubyfmt" },
			},

			formatters = {
				ocamlformat = {
					env = {
						OCAMLFORMAT = "profile=default,type-decl=sparse,module-item-spacing=preserve,break-infix=fit-or-vertical",
					},
				},
			},
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,

	init = function()
		vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
	end,
}
