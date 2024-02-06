---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.log_info("reloading")

require("tabs").setup(config)
require("mouse").setup(config)
require("links").setup(config)
require("keys").setup(config)

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
-- config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Colorscheme
config.color_scheme_dirs = { wezterm.home_dir }
config.color_scheme = "tokyonight_storm"
wezterm.add_to_config_reload_watch_list(config.color_scheme_dirs[1] .. config.color_scheme .. ".toml")

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6

config.term = "wezterm"
config.window_decorations = "RESIZE"

-- Fonts
config.font_size = 11
config.font = wezterm.font({ family = "JetBrains Mono" })
config.bold_brightens_ansi_colors = false
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 5, right = 5, top = 0, bottom = 0 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000

return config --[[@as Wezterm]]
