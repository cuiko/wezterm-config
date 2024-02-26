---@type wezterm
_G.wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_thickness = "1.8"
config.cursor_blink_rate = 1000
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- underline
config.underline_position = -8
config.underline_thickness = 3

return require("util").load(config, {
	-- ui
	"ui.colorscheme",
	"ui.font",
	"ui.tab",
	"ui.workspace",
	"ui.window",
	"ui.command_palette",
	-- keymaps
	"keymaps",
}, {
	-- overlay default config
})
