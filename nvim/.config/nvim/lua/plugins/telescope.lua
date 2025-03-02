return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},

	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},

				file_browser = {
					display_stat = { date = true, size = true, mode = false },
					hijack_netrw = true,
					follow_symlinks = true,
					hide_parent_dir = true,
					respect_gitignore = false,
					grouped = true,
					prompt_path = true,
					dir_icon = "󰉋",
					dir_icon_hl = "MiniIconsCyan",
				},
			},

			defaults = {
				layout_config = {
					prompt_position = "top",
					horizontal = { width = 0.95 },
					vertical = { width = 0.95 },
				},

				sorting_strategy = "ascending",
				file_ignore_patterns = { ".git/[^h]" },
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

				pickers = {
					find_files = {
						hidden = true,
					},
				},

				preview = {
					mime_hook = function(filepath, bufnr, _)
						local term = vim.api.nvim_open_term(bufnr, {})

						local function send_output(_, data, _, header)
							vim.api.nvim_chan_send(term, header)
							for _, d in ipairs(data) do
								vim.api.nvim_chan_send(term, d .. "\r\n")
							end
						end

						if vim.tbl_contains(vim.split(filepath:lower(), ".", { plain = true }), "tar") then
							vim.fn.jobstart({ "tar", "--exclude", "*/*", "-tvf", filepath }, {
								on_stdout = function(_, data, _)
									send_output(_, data, _, "----- Tar Archive Contents -----\r\n\r\n")
								end,
								stdout_buffered = true,
								pty = true,
							})
						elseif vim.tbl_contains(vim.split(filepath:lower(), ".", { plain = true }), "zip") then
							vim.fn.jobstart({ "zipinfo", "-z", filepath, "-x", "*/*" }, {
								on_stdout = function(_, data, _)
									send_output(_, data, _, "----- Zip Archive Contents -----\r\n\r\n")
								end,
								stdout_buffered = true,
								pty = true,
							})
						else
							vim.fn.jobstart({ "file", "-bpz", filepath }, {
								on_stdout = function(_, data, _)
									send_output(_, data, _, "----- File Type Classification -----\r\n\r\n")
								end,
								stdout_buffered = true,
								pty = true,
							})
						end
					end,
				},
				mappings = {
					n = {
						["x"] = require("telescope.actions").delete_buffer,
						["?"] = require("telescope.actions").which_key,

						["<C-d>"] = require("telescope.actions").preview_scrolling_down,
						["<C-e>"] = require("telescope.actions").preview_scrolling_up,
					},
					i = {
						["<M-x>"] = require("telescope.actions").delete_buffer,
						["<M-?>"] = require("telescope.actions").which_key,

						["<C-d>"] = require("telescope.actions").preview_scrolling_down,
						["<C-e>"] = require("telescope.actions").preview_scrolling_up,
					},
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		-- pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", function()
			builtin.buffers({ sort_lastused = true, ignore_current_buffer = false })
		end, { desc = "Find existing buffers" })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Search in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search Neovim files" })

		vim.keymap.set("n", "<leader>sN", function()
			builtin.find_files({ cwd = vim.fn.expand("~/notes") })
		end, { desc = "Search notes" })

		require("telescope").load_extension("file_browser")
	end,
}
