local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 17
config.color_scheme = "Kanagawa Dragon (Gogh)"
-- config.window_background_opacity = 0.30
-- config.macos_window_background_blur = 20

config.font = wezterm.font("JetBrains Mono")

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24

config.window_padding = {
	left = 2,
	right = 2,
	top = 20,
	bottom = 0,
}

return config
