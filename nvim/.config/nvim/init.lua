-- general setup
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.clipboard = ""
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.opt.termguicolors = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.colorcolumn = "96"

-- folding
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- disable unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- global helper functions
function exec_pwsh_cmd(cmd)
	local cmd_concat = table.concat(cmd, "; ")
	os.execute([[pwsh -c "]] .. cmd_concat .. [["]])
end

-- requiring
require("config.lazy")
require("config.autocmds").run()
require("config.lsp_config").run()
require("config.keymaps").run()
require("config.hl_groups").run()
require("luasnip.loaders.from_lua").load({ paths = { "./lua/config/snippets" } })
