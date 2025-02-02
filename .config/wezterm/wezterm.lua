local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Sonokai (Gogh)"
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 20.0

config.tab_bar_at_bottom = true

-- Left Option + n = ~
config.send_composed_key_when_left_alt_is_pressed = true

config.window_padding = {
	left = 0,
	right = 0,
	top = "1%",
	bottom = 0,
}

config.window_decorations = "RESIZE"

function active_tab_idx(mux_win)
	for _, item in ipairs(mux_win:tabs_with_info()) do
		-- wezterm.log_info('idx: ', idx, 'tab:', item)
		if item.is_active then
			return item.index
		end
	end
end

local act = wezterm.action
config.keys = {
	{ key = ".", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = ",", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	{ key = ".", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
	{ key = ",", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
	{ key = "+", mods = "CMD", action = act.IncreaseFontSize },
	{ key = "n", mods = "OPT", action = act({ SendString = "~" }) },
	{
		key = "t",
		mods = "CMD",
		-- https://github.com/wez/wezterm/issues/909
		action = wezterm.action_callback(function(win, pane)
			local mux_win = win:mux_window()
			local idx = active_tab_idx(mux_win)
			-- wezterm.log_info('active_tab_idx: ', idx)
			local tab = mux_win:spawn_tab({})
			-- wezterm.log_info('movetab: ', idx)
			win:perform_action(wezterm.action.MoveTab(idx + 1), pane)
		end),
	},
}

return config
