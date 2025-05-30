local function update_hl(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

return {
	-- {
	-- 	"djaruun/vague.nvim",
	-- 	config = function()
	-- 		require("vague").setup({
	-- 			style = {
	-- 				boolean = "none",
	-- 				number = "none",
	-- 				float = "none",
	-- 				error = "none",
	-- 				comments = "italic",
	-- 				conditionals = "none",
	-- 				functions = "none",
	-- 				headings = "bold",
	-- 				operators = "none",
	-- 				strings = "none",
	-- 				variables = "none",
	--
	-- 				keywords = "none",
	-- 				keyword_return = "none",
	-- 				keywords_loop = "none",
	-- 				keywords_label = "none",
	-- 				keywords_exception = "none",
	--
	-- 				builtin_constants = "none",
	-- 				builtin_functions = "none",
	-- 				builtin_types = "none",
	-- 				builtin_variables = "none",
	-- 			},
	-- 		})
	--
	-- 	end,
	-- },
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("onedark_dark")

			update_hl("@function.call", { italic = true })
			update_hl("@function.method.call", { italic = true })
			update_hl("Function", { italic = true })
			update_hl("@type", { italic = true })
			update_hl("@type.builtin", { italic = true })
			update_hl("StorageClass", { italic = true })
			update_hl("@constructor.lua", { italic = false })
			update_hl("@label", { italic = true })
			update_hl("@keyword", { italic = true })
			update_hl("Keyword", { italic = true })
			update_hl("@keyword.import", { italic = true })
		end,
	},
}
