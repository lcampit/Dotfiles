-- Keyboard and touchpad options
hl.config({
	input = {
		kb_layout = "us",
		-- Swap Caps Lock with Escape
		kb_options = "caps:swapescape",
		repeat_rate = 50,
		repeat_delay = 300,
		follow_mouse = 1,

		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
			clickfinger_behavior = true,
		},
	},
	gestures = {
		workspace_swipe_distance = 400,
		workspace_swipe_invert = true,
	},
})
