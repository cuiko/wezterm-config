wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	return tab.active_pane.title
end)

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	wezterm.log_info("overrides: ", overrides)
	if window:is_focused() then
		overrides.tab_bar_style = {
			window_close = wezterm.format({
				{ Foreground = { Color = "#ef6c5b" } },
				{ Text = "‍" },
				"ResetAttributes",
			}),
			window_close_hover = wezterm.format({
				{ Foreground = { Color = "#ef6c5b" } },
				{ Text = "‍󰅙" },
				"ResetAttributes",
			}),

			window_hide = wezterm.format({
				{ Foreground = { Color = "#f4c030" } },
				{ Text = "‍" },
				"ResetAttributes",
			}),
			window_hide_hover = wezterm.format({
				{ Foreground = { Color = "#f4c030" } },
				{ Text = "‍󰍶" },
				"ResetAttributes",
			}),

			window_maximize = wezterm.format({
				{ Foreground = { Color = "#56c138" } },
				{ Text = "‍ " },
				"ResetAttributes",
			}),
			window_maximize_hover = wezterm.format({
				{ Foreground = { Color = "#56c138" } },
				{ Text = "‍󰐗 " },
				"ResetAttributes",
			}),
		}
	else
		overrides.tab_bar_style = {
			window_close = wezterm.format({
				{ Foreground = { Color = "#3a3a44" } },
				{ Text = "‍" },
				"ResetAttributes",
			}),
			window_close_hover = wezterm.format({
				{ Foreground = { Color = "#3a3a44" } },
				{ Text = "‍󰅙" },
				"ResetAttributes",
			}),

			window_hide = wezterm.format({
				{ Foreground = { Color = "#3a3a44" } },
				{ Text = "‍" },
				"ResetAttributes",
			}),
			window_hide_hover = wezterm.format({
				{ Foreground = { Color = "#3a3a44" } },
				{ Text = "‍󰍶" },
				"ResetAttributes",
			}),

			window_maximize = wezterm.format({
				{ Foreground = { Color = "#3a3a44" } },
				{ Text = "‍ " },
				"ResetAttributes",
			}),
			window_maximize_hover = wezterm.format({
				{ Foreground = { Color = "#3a3a44" } },
				{ Text = "‍󰐗 " },
				"ResetAttributes",
			}),
		}
	end
	window:set_config_overrides(overrides)
end)

return {
	-- integrated button
	window_decorations = "RESIZE|INTEGRATED_BUTTONS",
	integrated_title_button_style = "Windows",
	integrated_title_button_alignment = "Left",
	integrated_title_buttons = { "Close", "Hide", "Maximize" },

	window_close_confirmation = "AlwaysPrompt",
	skip_close_confirmation_for_processes_named = {
		-- default
		"bash",
		"sh",
		"zsh",
		"fish",
		"tmux",
		"nu",
		"cmd.exe",
		"pwsh.exe",
		"powershell.exe",
		-- custom
	},

	-- padding
	window_padding = {
		left = "20",
		right = "0",
		top = "10",
		bottom = "0",
	},
}
