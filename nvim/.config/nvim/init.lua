vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
		["*"] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
	},
	cache_enabled = 0,
}

require("config.vim_options")
require("config.lazy")
require("config.cmds")
require("config.lsp_config")
require("config.keymaps")
require("luasnip.loaders.from_lua").load({ paths = { "./lua/config/snippets" } })
