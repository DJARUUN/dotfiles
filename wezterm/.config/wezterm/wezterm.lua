-- Vars --
local wt = require("wezterm")
local home = os.getenv("USERPROFILE")

-- Colors --
local col_bg = "#1c1e26"
local col_fg = "#a5b3e0"
local col_bg2 = "#272a35"
local col_inactive_fg = "#8b93b0"

-- Config table --
local config = {
	-- Shell --
	default_domain = "WSL:Debian",
	default_prog = { "pwsh.exe" },
	default_cwd = home,

	-- Theme --
	color_schemes = {
		["Nightfall Dimmed"] = wt.color.load_terminal_sexy_scheme(
			home .. [[\.config\wezterm\nightfall_dimmed_sexy.json]]
		),
	},
	color_scheme = "Nightfall Dimmed",

	colors = {
		cursor_fg = col_bg,
		cursor_bg = col_fg,
		cursor_border = col_fg,

		tab_bar = {
			active_tab = {
				bg_color = col_bg,
				fg_color = col_fg,
			},

			inactive_tab = {
				bg_color = col_bg2,
				fg_color = col_inactive_fg,
			},

			inactive_tab_hover = {
				bg_color = col_bg,
				fg_color = col_inactive_fg,
			},

			inactive_tab_edge = col_bg2,
		},
	},

	window_frame = {
		font = wt.font({ family = "Segoe UI", weight = "Bold" }),
		font_size = 9,
		active_titlebar_bg = col_bg2,
	},

	-- Style --
	font = wt.font({ family = "RecursiaMDSNF", harfbuzz_features = {} }),
	font_size = 9.5,
	line_height = 1.08,
	default_cursor_style = "BlinkingBlock",
	animation_fps = 1,

	-- Window --
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_padding = { left = 24, right = 24, top = 24, bottom = 24 },
	use_resize_increments = true,
	max_fps = 120,
}

return config
