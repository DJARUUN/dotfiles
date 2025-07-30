return {
	cmd = { "ruby-lsp" },
	filetypes = { "ruby", "eruby" },
	init_options = {
		formatter = "rubocop",
	},
	root_markers = { "Gemfile", ".git" },
}
