local allowed_globals = {}
for k, _ in pairs(_G) do
	table.insert(allowed_globals, k)
end

return {
	"rktjmp/hotpot.nvim",
	opts = {
		build = true,
		clean = false,
		compiler = {
			modules = {
				allowedGlobals = allowed_globals,
			},
		},
	},
}
