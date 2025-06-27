local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 15
-- config.color_scheme = "Afterglow"
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Dracula"
-- config.color_scheme = "GitHub Dark"

config.font = wezterm.font("JetBrains Mono")

config.window_decorations = "NONE | RESIZE"

config.enable_tab_bar = false
config.tab_bar_at_bottom = true

local act = wezterm.action

-- config.window_background_opacity = 0.70
-- config.macos_window_background_blur = 20

config.keys = {
	{
		key = "|",
		mods = "SUPER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
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
	-- Pane navigation (like `Ctrl-b h/j/k/l`)
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
