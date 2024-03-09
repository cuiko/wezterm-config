---@type wezterm
_G.wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- https://wezfurlong.org/wezterm/config/lua/config/term.html
config.term = "wezterm"

return require("util").load(config, {
	"tab_bar",
	"appearance",
	"keymaps",
}, {
	-- overlay default config
})
