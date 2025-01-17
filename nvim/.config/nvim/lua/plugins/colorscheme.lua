return {
	{
		"djaruun/vague.nvim",
		config = function()
			require("vague").setup({
				style = {
					boolean = "none",
					number = "none",
					float = "none",
					error = "none",
					comments = "italic",
					conditionals = "none",
					functions = "italic",
					headings = "bold",
					operators = "none",
					strings = "none",
					variables = "none",
					keywords = "none",
					keyword_return = "none",
					keywords_loop = "none",
					keywords_label = "none",
					keywords_exception = "none",
					builtin_constants = "none",
					builtin_functions = "none",
					builtin_types = "none",
					builtin_variables = "none",
				},
				colors = {
					bg = "#1c1f20",
					fg = "#7a7c95",
					floatBorder = "#878787",
					line = "#282830",
					comment = "#646477",
					builtin = "#bad1ce",
					func = "#ac817f",
					string = "#daac96",
					number = "#d2a374",
					property = "#c7c7d4",
					constant = "#b4b4ce",
					parameter = "#b9a3ba",
					visual = "#363738",
					error = "#d2788c",
					warning = "#e6be8c",
					hint = "#8ca0dc",
					operator = "#8c8ca5",
					keyword = "#617584",
					type = "#bcd3d3",
					search = "#465362",
					plus = "#8c8ca5",
					delta = "#e6be8c",
				},
			})

			vim.cmd.colorscheme("vague")

			vim.cmd([[highlight! LspReferenceText guibg=#363738 guifg=none]])
			vim.cmd([[highlight! LspReferenceRead guibg=#363738 guifg=none]])
			vim.cmd([[highlight! LspReferenceWrite guibg=#363738 guifg=none]])
			vim.cmd([[highlight! Visual guibg=#363738 guifg=none]])
			vim.cmd([[highlight! link StatusLine StatusLineTerm]])
			vim.cmd([[highlight! LspReferenceWrite guibg=#363738 guifg=none]])
			vim.cmd([[highlight! LineNr guifg=#7a7c95]])
			vim.cmd([[highlight! LineNrAbove guifg=#646477]])
			vim.cmd([[highlight! italicLineNrBelow guifg=#646477]])
			vim.cmd([[highlight! link @lsp.type.variable.python function.method.call.python]])

			local function update_hl(group, tbl)
				local old_hl = vim.api.nvim_get_hl_by_name(group, true)
				local new_hl = vim.tbl_extend("force", old_hl, tbl)
				vim.api.nvim_set_hl(0, group, new_hl)
			end

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
