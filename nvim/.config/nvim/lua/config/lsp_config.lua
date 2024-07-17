require("mason").setup()
require("mason-lspconfig").setup({})

local lspconfig = require("lspconfig")
local root_pattern = lspconfig.util.root_pattern

lspconfig.gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = root_pattern("go.work", "go.mod", ".git"),
	single_file_support = true,
})

if package.config:sub(1, 1) == "/" then
	lspconfig.phpactor.setup({
		root_dir = root_pattern("*"),
		on_attach = function(_)
			vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]])
		end,
	})
else
	lspconfig.intelephense.setup({
		root_dir = root_pattern(".git"),
	})
end

lspconfig.gleam.setup({
	root_dir = root_pattern("gleam.toml", ".git", "mix.exs"),
})

lspconfig.tsserver.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup({
	capabilities = capabilities,
	filetypes = { "html", "blade", "php", "twig", "matcha" },
})

lspconfig.svelte.setup({
	filetypes = { "svelte" },
	root_dir = root_pattern("svelte.config.js"),
})

lspconfig.zls.setup({
	root_dir = root_pattern("src"),
})

lspconfig.elixirls.setup({
	cmd = { "/home/caarg/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
	filetypes = { "elixir", "eelixir", "heex", "surface" },
	single_file_support = true,
	root_dir = root_pattern(".git", "mix.exs", "gleam.toml", "rebar.config"),
})

lspconfig.emmet_language_server.setup({
	filetypes = {
		"css",
		"eruby",
		"html",
		"htmldjango",
		"javascriptreact",
		"less",
		"pug",
		"sass",
		"scss",
		"typescriptreact",
		"svelte",
		"typescript",
		"twig",
		"blade",
		"matcha",
		"templ",
		"eelixir",
		"heex",
	},
})

lspconfig.bashls.setup({
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh" },
	root_dir = root_pattern(".git", "*.sh"),
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},
	single_file_support = true,
})

-- lspconfig.tailwindcss.setup({
-- 	filetypes = {
-- 		"html",
-- 		"svelte",
-- 		"php",
-- 		"twig",
-- 	},
-- 	settings = {
-- 		tailwindCSS = {
-- 			lint = {
-- 				cssConflict = "warning",
-- 				invalidApply = "error",
-- 				invalidConfigPath = "error",
-- 				invalidScreen = "error",
-- 				invalidTailwindDirective = "error",
-- 				invalidVariant = "error",
-- 				recommendedVariantOrder = "warning",
-- 			},
-- 			validate = true,
-- 			experimental = {
-- 				classRegex = {
-- 					'class[:]\\s*"([^"]*)"',
-- 				},
-- 			},
-- 		},
-- 	},
-- })

lspconfig.templ.setup({})

lspconfig.htmx.setup({
	filetypes = { "html", "templ" },
})

lspconfig.ocamllsp.setup({})
