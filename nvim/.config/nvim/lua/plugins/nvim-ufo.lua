return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local servers = require("lspconfig").util.available_servers()
		for _, ls in ipairs(servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
			})
		end

		require("ufo").setup({})
	end,
}
