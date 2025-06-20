return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			hint = { enable = true },
			telemetry = { enable = false },
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
}
