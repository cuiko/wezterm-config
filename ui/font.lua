return {
	font_size = 16,
	line_height = 1.5,
	font = wezterm.font_with_fallback({
		{ family = "Comic Code", weight = "DemiBold" },
		{ family = "CaskaydiaCove Nerd Font" },
		{ family = "PingFang SC", weight = "DemiBold" },
	}),
	adjust_window_size_when_changing_font_size = false,
	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font({ family = "Comic Code", weight = "Bold" }),
		},
		{
			intensity = "Half",
			font = wezterm.font({ family = "Comic Code", weight = "DemiBold" }),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({ family = "Comic Code", weight = "Bold", italic = true }),
		},
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font({ family = "Comic Code", weight = "DemiBold", italic = true }),
		},
	},
}
