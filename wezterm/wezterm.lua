local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMono NerdFont")
config.color_scheme = "Tokyo Night"

config.window_frame = {
	active_titlebar_bg = "#333333",
	inactive_titlebar_bg = "#333333",
}
config.use_fancy_tab_bar = true
config.default_cursor_style = "SteadyBar"

config.default_prog = { "zsh" }
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = false
config.window_padding = {
	top = "0.5cell",
	right = "1cell",
	bottom = "0.5cell",
	left = "1cell",
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- Load keys from outer file
-- config.keys = require("keys")

return config
