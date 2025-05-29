require("config.vim_options")
require("config.lazy")
require("config.keymaps")
require("config.cmds")
require("config.lsp")
require("config.custom")

-- Ugly workaround for not being able to exit using :wqa with terminal buffers open
vim.cmd([[
	command Z w | qa
	cabbrev wqa Z
]])
