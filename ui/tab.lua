local bar_bg = "#222436"
local normal_tab_bg = "#3b4261"
local normal_tab_fg = "#7aa2f7"
local active_tab_bg = "#7aa2f7"
local active_tab_fg = "#3b4261"

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function tab_title(tab_info)
	local pane = tab_info.active_pane
	local title = tab_info.window_title
	if title and #title == 0 then
		title = pane.title
	end

	local uri = pane.current_working_dir
	if uri then
		title = basename(uri.file_path)
	end

	local short = 5
	if #title > short * 2 then
		title = string.sub(title, 1, short) .. "…" .. string.sub(title, -short)
	end

	local pad = 2
	return string.format(string.rep(" ", pad) .. "%d: %s" .. string.rep(" ", pad), tab_info.tab_index + 1, title)
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local cells = {}

	local title = wezterm.truncate_right(tab_title(tab), max_width - 2)
	local is_first = tab.tab_index == 0
	local is_last = tab.tab_index == #tabs - 1
	local is_active = tab.is_active

	if is_active then
		table.insert(cells, { Background = { Color = active_tab_bg } })
		if is_first then
			table.insert(cells, { Foreground = { Color = bar_bg } })
		else
			table.insert(cells, { Foreground = { Color = normal_tab_bg } })
		end
		table.insert(cells, { Text = "" })
		table.insert(cells, { Attribute = { Intensity = "Bold" } })
		table.insert(cells, { Background = { Color = active_tab_bg } })
		table.insert(cells, { Foreground = { Color = active_tab_fg } })
		table.insert(cells, { Text = title })
		if is_last then
			table.insert(cells, { Background = { Color = bar_bg } })
		else
			table.insert(cells, { Background = { Color = normal_tab_bg } })
		end
		table.insert(cells, { Foreground = { Color = active_tab_bg } })
		table.insert(cells, { Text = "" })
	else
		table.insert(cells, { Background = { Color = normal_tab_bg } })
		if is_first then
			table.insert(cells, { Foreground = { Color = bar_bg } })
		else
			table.insert(cells, { Foreground = { Color = normal_tab_bg } })
		end
		table.insert(cells, { Text = "" })
		table.insert(cells, { Background = { Color = normal_tab_bg } })
		table.insert(cells, { Foreground = { Color = normal_tab_fg } })
		table.insert(cells, { Text = title })
		if is_last then
			table.insert(cells, { Background = { Color = bar_bg } })
		else
			table.insert(cells, { Background = { Color = normal_tab_bg } })
		end
		table.insert(cells, { Foreground = { Color = normal_tab_bg } })
		table.insert(cells, { Text = "" })
	end

	return wezterm.format(cells)
end)

return {
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	tab_max_width = 20,
	tab_bar_at_bottom = false,
	status_update_interval = 300,

	colors = {
		tab_bar = {
			background = bar_bg,
			new_tab = { bg_color = bar_bg, fg_color = "#434C5E" },
			new_tab_hover = { bg_color = bar_bg, fg_color = "#8494C4" },
		},
	},

	tab_bar_style = {
		new_tab = " 󰐖",
		new_tab_hover = " 󰐖",

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
	},
}
