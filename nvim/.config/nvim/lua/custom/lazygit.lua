local state = {
	last_bufnr = nil,
}

local function find_lazygit_buf()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_get_name(bufnr):match("term://.*:lazygit") then
			return bufnr
		end
	end

	return nil
end

local function toggle_lazygit_hidden()
	local lazygit_bufnr = find_lazygit_buf()
	local current_bufnr = vim.api.nvim_get_current_buf()

	-- currently in the lazygit buffer
	-- toggle back to the previous buffer
	if lazygit_bufnr and lazygit_bufnr == current_bufnr then
		if state.last_bufnr and vim.api.nvim_buf_is_valid(state.last_bufnr) then
			vim.api.nvim_set_current_buf(state.last_bufnr)
		else
			-- fallback to the first buffer if we lost our previous buffer since opening the lazygit buffer
			vim.cmd.buffer(vim.api.nvim_list_bufs()[1])
		end
	-- in a regular buffer
	-- toggle to the lazygit buffer
	else
		state.last_bufnr = current_bufnr

		-- if we have one switch to it
		if lazygit_bufnr then
			vim.api.nvim_set_current_buf(lazygit_bufnr)

			vim.cmd("startinsert")
		-- if not create one
		else
			vim.cmd("term lazygit")
			local new_bufnr = vim.api.nvim_get_current_buf()

			-- mark the buffer as unlisted
			-- will make it be ignored by most bufferline plugins etc
			vim.bo[new_bufnr].buflisted = false

			vim.cmd("startinsert")
		end
	end
end

-- force close the lazygit buffer to let the user quit without it having issues with running jobs

local lazygit_term_group = vim.api.nvim_create_augroup("LazygitTermCleanup", { clear = true })

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = lazygit_term_group,
	pattern = "*", -- run for any buffer when quitting
	callback = function()
		local lazygit_bufnr = find_lazygit_buf()
		if lazygit_bufnr then
			-- forcefully delete the buffer to kill the running job
			vim.api.nvim_buf_delete(lazygit_bufnr, { force = true })
		end
	end,
	desc = "Kill the lazygit terminal before quitting Vim.",
})

vim.keymap.set("n", "<leader>gg", toggle_lazygit_hidden, { silent = true, desc = "Toggle Lazygit" })
