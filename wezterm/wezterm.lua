---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.log_info("reloading")

-- tabs
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.unzoom_on_switch_pane = true

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
-- config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Colorscheme
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

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

-- keys
require("keys")

return config --[[@as Wezterm]]
