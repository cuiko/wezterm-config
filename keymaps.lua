local action = wezterm.action

local workspaces = {
	"Local",
}

function workspaces:default()
	return self[1]
end

return {
	default_workspace = workspaces:default(),
	unix_domains = {
		{ name = workspaces:default() },
	},
	default_gui_startup_args = { "connect", workspaces:default() },
	disable_default_key_bindings = false,
	leader = {
		key = "z",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	},
	keys = {
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
				name = workspaces:default(),
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
	},
}
