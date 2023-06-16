local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMono NerdFont")
config.color_scheme = "Catppuccin Mocha"

return config
