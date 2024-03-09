local action = wezterm.action

local default_keymaps = {
	{
		key = "c",
		mods = "SUPER",
		action = action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "SUPER",
		action = action.PasteFrom("Clipboard"),
	},
	{
		key = "m",
		mods = "SUPER",
		action = action.Hide,
	},
	{
		key = "n",
		mods = "SUPER",
		action = action.SpawnWindow,
	},
	{
		key = "t",
		mods = "SUPER",
		action = action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "-",
		mods = "SUPER",
		action = action.DecreaseFontSize,
	},
	{
		key = "=",
		mods = "SUPER",
		action = action.IncreaseFontSize,
	},
	{
		key = "0",
		mods = "SUPER",
		action = action.ResetFontSize,
	},
	{
		key = "w",
		mods = "SUPER",
		action = action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "1",
		mods = "SUPER",
		action = action.ActivateTab(0),
	},
	{
		key = "2",
		mods = "SUPER",
		action = action.ActivateTab(1),
	},
	{
		key = "3",
		mods = "SUPER",
		action = action.ActivateTab(2),
	},
	{
		key = "4",
		mods = "SUPER",
		action = action.ActivateTab(3),
	},
	{
		key = "5",
		mods = "SUPER",
		action = action.ActivateTab(4),
	},
	{
		key = "6",
		mods = "SUPER",
		action = action.ActivateTab(5),
	},
	{
		key = "7",
		mods = "SUPER",
		action = action.ActivateTab(6),
	},
	{
		key = "8",
		mods = "SUPER",
		action = action.ActivateTab(7),
	},
	{
		key = "[",
		mods = "SUPER|SHIFT",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "SUPER|SHIFT",
		action = action.ActivateTabRelative(1),
	},
	{
		key = "r",
		mods = "SUPER",
		action = action.ReloadConfiguration,
	},
	{
		key = "h",
		mods = "SUPER",
		action = action.HideApplication,
	},
	{
		key = "f",
		mods = "SUPER",
		action = action.Search({
			"CaseSensitiveString",
		}),
	},
}

local custom_keymaps = {
	{
		key = ",",
		mods = "SUPER",
		action = action.SpawnCommandInNewTab({
			args = {
				"/usr/local/share/nvim/bin/nvim",
				wezterm.config_dir,
			},
		}),
	},
	{
		key = "l",
		mods = "SUPER",
		action = action.ShowDebugOverlay,
	},
	{
		key = "p",
		mods = "SUPER",
		action = action.ActivateCommandPalette,
	},
	{
		key = "9",
		mods = "SUPER",
		action = action.ShowTabNavigator,
	},
	{
		key = "q",
		mods = "SUPER",
		action = action.QuitApplication,
	},
	{
		key = "z",
		mods = "LEADER|CTRL",
		action = action.SendKey({
			key = "z",
			mods = "CTRL",
		}),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "-",
		mods = "LEADER",
		action = action.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "h",
		mods = "LEADER|CTRL",
		action = action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER|CTRL",
		action = action.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "LEADER|CTRL",
		action = action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER|CTRL",
		action = action.ActivatePaneDirection("Up"),
	},
	{
		key = "LeftArrow",
		mods = "LEADER|CTRL",
		action = action.AdjustPaneSize({
			"Left",
			4,
		}),
	},
	{
		key = "RightArrow",
		mods = "LEADER|CTRL",
		action = action.AdjustPaneSize({
			"Right",
			4,
		}),
	},
	{
		key = "UpArrow",
		mods = "LEADER|CTRL",
		action = action.AdjustPaneSize({
			"Up",
			1,
		}),
	},
	{
		key = "DownArrow",
		mods = "LEADER|CTRL",
		action = action.AdjustPaneSize({
			"Down",
			1,
		}),
	},
	{
		key = "z",
		mods = "LEADER",
		action = action.TogglePaneZoomState,
	},
	{
		key = "1",
		mods = "LEADER",
		action = action.SwitchToWorkspace({
			name = "local",
		}),
	},
	{
		key = "[",
		mods = "LEADER",
		action = action.SwitchWorkspaceRelative(-1),
	},
	{
		key = "]",
		mods = "LEADER",
		action = action.SwitchWorkspaceRelative(1),
	},
	{
		key = "9",
		mods = "LEADER",
		action = action.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

return {
	disable_default_key_bindings = true,
	leader = {
		key = "z",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	},
	keys = require("util").concat(default_keymaps, custom_keymaps),
}
