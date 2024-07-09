local M = {}

-- filetypes
vim.filetype.add({
	extension = {
		matcha = "matcha",
	},
})

-- general
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch" })
	end,
})

vim.api.nvim_create_autocmd("User", { command = "highlight! Foreground guifg=#2e383c" })

-- color scheme
vim.api.nvim_create_autocmd("VimEnter", { command = "colorscheme nightfall_dimmed" })
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, { command = "lua Fix_syntax_hl()" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link Normal @property" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link NormalNC @property" })

-- statusline
vim.api.nvim_create_autocmd("User", { command = "highlight! link StatusLineTerm StatusLineTermNC" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link StatusLineTermNC StatusLineTermNC" })

-- telescope
vim.api.nvim_create_autocmd("User", { command = "highlight! link TelescopeBorder LspSagaDiagnosticBorder" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link TelescopePromptBorder LspSagaDiagnosticBorder" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link TelescopeResultsBorder LspSagaCodeActionBorder" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link TelescopeNormal DiffviewNormal" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link TelescopeSelection PmenuSel" })

-- lspreference
vim.api.nvim_create_autocmd("User", { command = "highlight! LspReferenceRead guibg=NONE guifg=NONE gui=underline" })
vim.api.nvim_create_autocmd("User", { command = "highlight! LspReferenceWrite guibg=NONE guifg=NONE gui=underline" })
vim.api.nvim_create_autocmd("User", { command = "highlight! LspReferenceText guibg=NONE guifg=NONE gui=underline" })

-- lazygit
vim.api.nvim_create_autocmd("User", { command = "highlight! link LazyGitBorder NormalFloat" })

-- gitsigns
vim.api.nvim_create_autocmd("User", { command = "highlight! link GitSignsCurrentLineBlame Comment" })

-- flash
vim.api.nvim_create_autocmd("User", { command = "highlight! link FlashLabel FlashCursor" })

-- nvim-ufo
vim.api.nvim_create_autocmd("User", { command = "highlight! link FoldColumn Foreground" })

-- html
vim.api.nvim_create_autocmd("User", { command = "highlight! link Title @none" })

-- rust
vim.api.nvim_create_autocmd("User", { command = "highlight! link Macro @function.method.call" })

-- cmp and hover markdown
vim.api.nvim_create_autocmd("User", { command = "highlight! link markDownCode markDownBold" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link @markup.raw.block.markdown markDownBold" })

-- elixir
vim.api.nvim_create_autocmd("User", { command = "highlight! link SpecialChar @property" })

-- mini indentscope
vim.api.nvim_create_autocmd("User", { command = "highlight! link MiniIndentscopeSymbol LineNr" })

-- whichkey
vim.api.nvim_create_autocmd("User", { command = "highlight! link WhichKey @function" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link WhichKeyDesc @string" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link WhichKeySeparator Normal" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link WhichKeyGroup @punctuation.bracket" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link WhichKeyFloat NormalFloat" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link WhichKeyFloating NormalFloat" })

-- mini starter
vim.api.nvim_create_autocmd("User", { command = "highlight! link MiniStarterFooter MiniStarterInactive" })

-- lsp diagnostics
vim.api.nvim_create_autocmd("User", { command = "highlight! link DiagnosticVirtualTextError LspDiagnosticsSignError" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link DiagnosticVirtualTextWarn LspDiagnosticsSignWarning" })
vim.api.nvim_create_autocmd("User", { command = "highlight! link DiagnosticVirtualTextHint LspDiagnosticsSignHint" })
vim.api.nvim_create_autocmd(
	"User",
	{ command = "highlight! link DiagnosticVirtualTextInfo LspDiagnosticsSignInformation" }
)

return M
