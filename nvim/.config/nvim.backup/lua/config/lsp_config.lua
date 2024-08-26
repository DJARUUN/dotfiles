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

lspconfig.svelte.setup({
	filetypes = { "svelte" },
	root_dir = root_pattern("svelte.config.js"),
})

lspconfig.elixirls.setup({
	settings = {
		elixirLS = {
			autoBuild = true,
			dialyzerEnabled = true,
			incrementalDialyzer = true,
			fetchDeps = true,
			suggestSpecs = true,
			signatureAfterComplete = true,
			enableTestLenses = true,
		},
	},
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

-- lspconfig.tailwindcss.setup({
-- 	root_dir = root_pattern(".git"),
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

lspconfig.htmx.setup({
	filetypes = { "html", "templ" },
})

require("mason-lspconfig").setup_handlers({
	["rubocop"] = function() end,
})

lspconfig.asm_lsp.setup({
	cmd = { "asm-lsp" },
	filetypes = { "asm", "vmasm" },
	root_dir = root_pattern(".git", "*.s", "*.asm"),
})