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

return {}
