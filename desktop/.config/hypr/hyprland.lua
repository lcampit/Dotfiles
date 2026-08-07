require("keybinds")
require("themes")
require("monitors")
require("windowrules")
require("animations")

-- General options
hl.config({
	general = {
		layout = "master",
		border_size = 4,
		gaps_in = 8,
		gaps_out = 4,
		resize_on_border = true,
	},
	master = {
		mfact = 0.70,
	},
	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		vrr = 3,
		font_family = "JetBrains Mono",
	},
})
