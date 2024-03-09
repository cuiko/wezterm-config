---@type wezterm
_G.wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

return require("util").load(config, {
	"tab",
	"ui",
	"keymaps",
}, {
	-- overlay default config

	-- tempfile=$(mktemp) \
	--   && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo \
	--   && tic -x -o ~/.terminfo $tempfile \
	--   && rm $tempfile
	term = "wezterm",
})
