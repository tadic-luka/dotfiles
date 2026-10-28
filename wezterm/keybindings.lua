local wezterm = require("wezterm")
local consts = require("consts")
local action = wezterm.action

local leader_key = { key = "a", mods = "CTRL", timeout_milliseconds = 1001 }
-- pane is in tmux if pane title is tmux

local function is_in_tmux(pane)
	return pane:get_title() == "tmux"
end

-- toggle leader key
wezterm.on("toggle-leader-key", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.leader then
		overrides.leader = { key = "F11", mods = "SHIFT" }
	else
		overrides.leader = nil
	end
	window:set_config_overrides(overrides)
	local effective = window:effective_config()
end)

-- executes keybinding based on if we are in tmux
-- we determine if we are in tmux if pane title contains "tmux"
-- this requires tmux to set term title using set-titles-string option to tmux
local function execute_tmux_keybinding(window, pane, key, default_action)
	if is_in_tmux(pane) then
		window:perform_action(
			action.Multiple({
				action.SendKey({
					mods = "CTRL",
					key = "a",
				}),
				action.SendKey({
					key = key,
				}),
			}),
			pane
		)
	else
		window:perform_action(default_action, pane)
	end
end

local function open_url(url)
	wezterm.log_info("opening: " .. url)
	if string.sub(url, 1, 1) == "D" then
		wezterm.open_with("https://www.internalfb.com/diff/" .. url)
	elseif string.sub(url, 1, 1) == "P" then
		wezterm.open_with("https://www.internalfb.com/phabricator/paste/view/" .. url)
	elseif string.sub(url, 1, 1) == "T" then
		wezterm.open_with("https://www.internalfb.com/" .. url)
	else
		wezterm.open_with(url)
	end
end

local Keys = {}
Keys.keys = {
	{
		mods = "CTRL|SHIFT",
		key = "o",
		action = wezterm.action_callback(function(win, pane)
			wezterm.log_info("Hello from callback!")
			wezterm.log_info("WindowID:", win:window_id(), "Panetitle:", pane:get_title())
		end),
	},
	{ key = "F12", mods = "NONE", action = wezterm.action.EmitEvent("toggle-leader-key") },
	{ key = "f", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
	{ key = "n", mods = "CMD", action = "SpawnWindow" },
	{ key = "f", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
	{
		key = "O",
		mods = "CTRL",
		action = wezterm.action({
			QuickSelectArgs = {
				label = "open url",
				patterns = {
					"https?://\\S+",
					consts.diff_reg,
					consts.task_reg,
					consts.paste_reg,
				},
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					open_url(url)
				end),
			},
		}),
	},
	-- if in tmux pass keys to tmux, otherwise do as tmux would do
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "\\", action.SplitHorizontal({ domain = "CurrentPaneDomain" }))
		end),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "-", action.SplitVertical({ domain = "CurrentPaneDomain" }))
		end),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "h", action.ActivatePaneDirection("Left"))
		end),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "j", action.ActivatePaneDirection("Down"))
		end),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "k", action.ActivatePaneDirection("Up"))
		end),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "l", action.ActivatePaneDirection("Right"))
		end),
	},
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "z", action.TogglePaneZoomState)
		end),
	},
	{
		key = "]",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "]", action.TogglePaneZoomState)
		end),
	},
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "[", action.ActivateCopyMode)
		end),
	},
	{
		key = "0",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "0", action.ActivateTab(0))
		end),
	},
	{
		key = "1",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "1", action.ActivateTab(1))
		end),
	},
	{
		key = "2",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "2", action.ActivateTab(2))
		end),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "s", action.Nop)
		end),
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "c", action.SpawnTab("DefaultDomain"))
		end),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "n", action.ActivateTabRelative(1))
		end),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "p", action.ActivateTabRelative(-1))
		end),
	},
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			execute_tmux_keybinding(window, pane, "d", action.Nop)
		end),
	},
}
Keys.leader_key = leader_key
Keys.key_tables = {}

return Keys
