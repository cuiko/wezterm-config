local SOLID_LEFT_ARROW = ""

wezterm.on("update-right-status", function(window, pane)
	local cells = {}

	if window:leader_is_active() then
		table.insert(
			cells,
			wezterm.format({
				{ Text = "⌨️" },
			})
		)
	end

	table.insert(cells, window:active_workspace())

	local text_bg = "#5168AB"
	local text_fg = "#ffffff"

	local elements = {}
	local num_cells = 0

	local function push(text, is_last)
		local cell_no = num_cells + 1
		if cell_no == 1 then
			table.insert(elements, { Foreground = { Color = text_bg } })
			table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end

		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = text_bg } })
		table.insert(elements, { Text = " " .. text .. " " })

		if not is_last then
			-- table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			-- table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end

		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)

-- change leader key if in tmux
local keymaps = require("keymaps")
wezterm.on("user-var-changed", function(window, pane, name, value)
	local user_vars = pane:get_user_vars()
	local is_tmux = (user_vars.WEZTERM_IN_TMUX and user_vars.WEZTERM_IN_TMUX ~= "0")
		or (user_vars.WEZTERM_PROG and user_vars.WEZTERM_PROG:match("^tmux"))
	local overrides = window:get_config_overrides() or {}
	if is_tmux then
		-- change to other leader
		overrides.leader = {
			key = "a",
			mods = "CTRL",
			timeout_milliseconds = 1000,
		}
	else
		-- use default leader
		overrides.leader = keymaps.leader
	end
	window:set_config_overrides(overrides)
end)

return {}
