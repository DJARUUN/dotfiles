local function update_hl(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

-- global function called from an autocmd
function Fix_italics()
	update_hl("@comment", { italic = true })
	update_hl("Comment", { italic = true })
	update_hl("String", { italic = false })

	update_hl("Keyword", { italic = true })
	update_hl("@keyword.return", { italic = true })
	update_hl("@keyword.function", { italic = true })

	update_hl("Include", { italic = true })
	update_hl("@function.call", { italic = true })
	update_hl("@function.method.call", { italic = true })
	update_hl("Function", { italic = true })
	update_hl("Define", { italic = true })
	update_hl("@property", { italic = false })

	update_hl("@type", { italic = true })
	update_hl("@type.builtin", { italic = true })
	update_hl("StorageClass", { italic = true })
end
