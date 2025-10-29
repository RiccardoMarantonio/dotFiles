local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 17
config.color_scheme = "Afterglow"
-- config.window_background_opacity = 0.30
-- config.macos_window_background_blur = 20

config.font = wezterm.font("MesloLGL Nerd Font Mono")

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "s", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "c", mods = "" }),
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "s", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "w", mods = "" }),
		}),
	},
	{
		key = "]",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "s", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "]", mods = "" }),
		}),
	},
	{
		key = "[",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "s", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "[", mods = "" }),
		}),
	},
}

return config
