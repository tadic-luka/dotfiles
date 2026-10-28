local wezterm = require("wezterm")
local keys = require("keybindings")
local hyperlinks = require("hyperlinks")
local consts = require("consts")

-- local gpus = wezterm.gui.enumerate_gpus()

return {
	-- color_scheme = "Gruvbox dark, medium (base16)",
	color_scheme = "Noctalia-Kanagawa",
	window_decorations = "NONE",
	hide_tab_bar_if_only_one_tab = true,
	-- enable_tab_bar = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	native_macos_fullscreen_mode = false,
	font = wezterm.font("JetBrainsMonoNL Nerd Font"),
	hyperlink_rules = hyperlinks,
	quick_select_patterns = {
		consts.diff_reg,
		consts.task_reg,
		consts.paste_reg,
	},
	-- like "prefix" in tmux
	leader = keys.leader_key,
	keys = keys.keys,
	key_tables = keys.key_tables,
	unix_domains = {
		{
			name = "unix",
		},
	},
	-- webgpu_preferred_adapter = gpus[1],
	front_end = "WebGpu",
}
