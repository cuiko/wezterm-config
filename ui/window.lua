wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	return tab.active_pane.title
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
