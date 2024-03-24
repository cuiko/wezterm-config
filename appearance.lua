return {
	-- colose scheme
	color_scheme = "nightfox",

	-- command palette
	command_palette_rows = 10,
	command_palette_bg_color = "#202334",
	command_palette_fg_color = "#a9b1d3",
	command_palette_font_size = 18,

	-- cursor
	default_cursor_style = "BlinkingBlock",
	cursor_thickness = "1.8",
	cursor_blink_rate = 1000,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",

	-- underline
	underline_position = -8,
	underline_thickness = 3,

	-- font
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
