local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action -- This is the missing piece!

config.font_size = 17
config.color_scheme = "nordfox"
-- config.window_background_opacity = 0.30
-- config.macos_window_background_blur = 20

config.font = wezterm.font("Lilex Nerd Font Mono")

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24

config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

-- 1. Catch the custom payload from your fzf script
wezterm.on("user-var-changed", function(window, pane, name, value)
	if name == "switch-workspace" then
		local cmd_context = wezterm.json_parse(value)
		local opts = { name = cmd_context.workspace }

		-- Only inject a starting directory if the bash script provided one
		if cmd_context.cwd then
			opts.spawn = { cwd = cmd_context.cwd }
		end

		window:perform_action(act.SwitchToWorkspace(opts), pane)
	end
end)

-- ########## LEADER KEY (Tmux Prefix: Ctrl-s) ##########
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }

-- ########## KEYBINDINGS ##########
config.keys = {
	-- Your FZF Sessionizer (From earlier)
	{
		key = "f",
		mods = "CTRL",
		action = act.SplitPane({
			direction = "Down",
			size = { Percent = 30 },
			command = { args = { "bash", os.getenv("HOME") .. "/dev/scripts/wezterm-sessionizer.sh" } },
		}),
	},
	-- Map Cmd + Delete to clear the line (sends Ctrl+u)
	{
		key = "Backspace",
		mods = "SUPER",
		action = act.SendKey({ key = "u", mods = "CTRL" }),
	},
	-- Reload Config (Prefix + r)
	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },

	-- Copy Mode (Prefix + a) - Wezterm uses vi bindings by default here
	{ key = "a", mods = "LEADER", action = act.ActivateCopyMode },

	-- Lazygit (Ctrl-g) - Spawns in a temporary new tab instead of a float
	{
		key = "g",
		mods = "CTRL",
		action = act.SpawnCommandInNewTab({
			-- This opens your default shell, loads your profile, and then runs lazygit
			args = { os.getenv("SHELL") or "zsh", "-l", "-c", "lazygit" },
		}),
	},

	-- Zsh "Popup" (Prefix + z) - Spawns in a 60% bottom split
	{
		key = "z",
		mods = "LEADER",
		action = act.SplitPane({ direction = "Down", size = { Percent = 60 }, command = { args = { "zsh" } } }),
	},

	-- NAVIGATION: Pane Switching (Prefix + h/j/k/l)
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- NAVIGATION: Tabs (Prefix + [ and ])
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },

	-- SPLITS & NEW WINDOWS
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "d", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "D", mods = "LEADER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- CLOSING & DETACHING
	{ key = "w", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "W", mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "q", mods = "LEADER", action = act.DetachDomain("CurrentPaneDomain") },

	-- SESSION MANAGEMENT
	-- Previous Workspace (Prefix + p) -> Opens Wezterm's built-in workspace menu to select a running one
	{ key = "p", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "WORKSPACES" }) },

	-- Create new workspace from current dir (Prefix + n)
	{
		key = "n",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new workspace name:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
				end
			end),
		}),
	},
}

return config
