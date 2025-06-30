local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 17
config.color_scheme = "Gruvbox Material (Gogh)"
config.window_background_opacity = 0.30
config.macos_window_background_blur = 20

config.font = wezterm.font("JetBrains Mono")

config.window_decorations = "RESIZE"

config.window_frame = {
	active_titlebar_bg = "#1e1e2e",
	inactive_titlebar_bg = "#1e1e2e",
}

local act = wezterm.action

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24
config.colors = {
	tab_bar = {
		background = "#282828", -- dark bar background (Warp-like)

		active_tab = {
			bg_color = "#363532",
			fg_color = "#D9CAA4",
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		inactive_tab = {
			bg_color = "#2E2D2C",
			fg_color = "#9F967C",
		},

		inactive_tab_hover = {
			bg_color = "#363532",
			fg_color = "#9F967C",
			italic = true,
		},

		new_tab = {
			bg_color = "#282828",
			fg_color = "#D9CAA4",
		},

		new_tab_hover = {
			bg_color = "#363532",
			fg_color = "#cdd6f4",
		},
	},
}

config.keys = {
	{
		key = "y",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
			wezterm.action.ClearSelection,
			wezterm.action.SendKey({ key = "Escape" }),
		}),
	},
	{
		key = "d",
		mods = "SUPER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = "SUPER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "W",
		mods = "SUPER|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{ key = "w", mods = "CTRL", action = act.PaneSelect },
	{ key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Right", 20 }) },
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Left", 20 }) },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Up", 10 }) },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Down", 10 }) },
	{ key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },
}
config.window_padding = {
	left = 2,
	right = 2,
	top = 20,
	bottom = 0,
}

return config
