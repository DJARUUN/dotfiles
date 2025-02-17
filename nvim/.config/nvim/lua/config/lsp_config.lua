require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = {}, automatic_installation = false })

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local util = lspconfig.util
local root_pattern = util.root_pattern

if not configs.c3_lsp then
	configs.c3_lsp = {
		default_config = {
			cmd = { "c3lsp" },
			filetypes = { "c3", "c3i" },
			root_dir = root_pattern(".git", "project.json", "*.c3"),
			settings = {},
			name = "c3_lsp",
		},
	}
end
lspconfig.c3_lsp.setup({})

lspconfig.gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = root_pattern("go.work", "go.mod", ".git"),
	single_file_support = true,
	settings = {
		gopls = {
			gofumpt = true,
			semanticTokens = true,
			staticcheck = true,
			noSemanticString = true,
			-- hints = {
			-- 	compositeLiteralFields = true,
			-- 	parameterNames = true,
			-- },
		}
	}
})

if package.config:sub(1, 1) == "/" then
	lspconfig.phpactor.setup({
		filetypes = { "php", "blade" },
	})
else
	lspconfig.intelephense.setup({
		root_dir = root_pattern("*"),
	})
end

lspconfig.gleam.setup({
	root_dir = root_pattern("gleam.toml", ".git", "mix.exs"),
})

lspconfig.svelte.setup({
	filetypes = { "svelte" },
	root_dir = root_pattern("svelte.config.js", "mix.exs", ".git"),
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
		"eruby",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"less",
		"pug",
		"typescriptreact",
		"svelte",
		"typescript",
		"twig",
		"blade",
		"matcha",
		"templ",
		"eelixir",
		"heex",
		"php",
	},
})

lspconfig.tailwindcss.setup({
	root_dir = root_pattern(".git"),
	filetypes = {
		"html",
		"svelte",
		"php",
		"twig",
		"typescriptreact",
		"eruby",
	},
	settings = {
		tailwindCSS = {
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
			experimental = {
				classRegex = {
					'class[:]\\s*"([^"]*)"',
				},
			},
		},
	},
})

lspconfig.html.setup({
	filetypes = {
		"html",
	},
})

lspconfig.asm_lsp.setup({
	cmd = { "asm-lsp" },
	filetypes = { "asm", "vmasm" },
	root_dir = root_pattern(".git", "*.s", "*.asm"),
})

-- lspconfig.solargraph.setup({
-- 	cmd = { "solargraph", "stdio" },
-- 	filetypes = { "ruby" },
-- 	init_options = {
-- 		formatting = true,
-- 	},
-- 	root_dir = root_pattern("Gemfile", ".git"),
-- 	settings = {
-- 		solargraph = {
-- 			diagnostics = true,
-- 		},
-- 	},
-- })

lspconfig.ruby_lsp.setup({
	cmd = { "ruby-lsp" },
	filetypes = { "ruby", "eruby" },
	single_file_support = true,
	-- init_options = {
	-- 	formatter = "rubyfmt",
	-- },
})

-- lspconfig.rubocop.setup({
-- 	cmd = { "rubocop", "--lsp" },
-- 	filetypes = { "ruby" },
-- })

lspconfig.basedpyright.setup({
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
	single_file_support = true,
})

lspconfig.zls.setup({})

lspconfig.hls.setup({})

lspconfig.volar.setup({
	filetypes = { 'vue', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
	settings = {
		vue = {
			autoInsert = {
				dotValue = true,
			},
		},
	},
})
