-- super key
local mainMod = "SUPER"

local scriptsDir = "~/.config/hypr/scripts/"

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

-- frequently used programs
local terminal = "ghostty --gtk-single-instance=true"
local browser = "brave"
local fileManager = "thunar"
local appLauncher = "wofi"

-- have GUI apps opened from the terminal swallow the terminal window
hl.config({
	misc = {
		enable_swallow = true,
		swallow_regex = "^" .. terminal .. "$",
	},
})

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(scriptsDir .. "clip-manager.sh"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(scriptsDir .. "wofi.sh"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(scriptsDir .. "wofi-big.sh"))

hl.window_rule({
	name = "floating file manager",
	match = { class = fileManager },
	float = true,
})

hl.bind("SUPER + Space", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
end)

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd(scriptsDir .. "restore-portal-conflicts.sh")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("wl-paste --watch cliphist store ")
	hl.exec_cmd("ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd(
		"waybar --bar main-bar --log-level error --config ~/.config/hypr/waybar/config --style ~/.config/hypr/waybar/style.css"
	)
	hl.exec_cmd("mako --config ~/.config/hypr/mako/config")
	hl.exec_cmd(terminal)
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
	hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ workspace = -1, follow = false }))
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.window.move({ workspace = -1, follow = true }))
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1", follow = false }))
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.window.move({ workspace = "+1", follow = true }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "e-1" }))

-- Special Workspace
hl.workspace_rule({
	workspace = "special:scratchpad",
	persistent = true, -- Keep workspace alive when empty
})
-- Toggle special workspace visibility
hl.bind(mainMod .. " + u", hl.dsp.workspace.toggle_special("magic"))
-- Move active window to the special workspace
hl.bind(mainMod .. " + SHIFT + u", hl.dsp.window.move({ workspace = "special:magic" }))

-- Group keybindings
hl.bind(mainMod .. " + g", hl.dsp.group.toggle())
hl.bind(mainMod .. " + tab", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.group.prev())

-- Laptop special keys
-- Volume button that allows press and hold, volume limited to 200%
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer --allow-boost --set-limit 200 -i 5"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer --allow-boost --set-limit 200 -d 5"), { repeating = true })

-- Toggle Audio Mute
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scriptsDir .. "toggle-mute.sh"))

-- Toggle Mic Mute
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scriptsDir .. "toggle-mic.sh"))

-- Handle brightness with laptop keys
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Make screenshots with laptop key (F7)
hl.bind("XF86Display", hl.dsp.exec_cmd(scriptsDir .. "screenshot.sh --now"))
hl.bind("SHIFT + XF86Display", hl.dsp.exec_cmd(scriptsDir .. "screenshot.sh --area"))

-- Move window with Super + LMB drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Resize window with Super + RMB drag
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move next window on top and make it active
hl.bind("ALT + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next()) -- Change focus to another window
	hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end)

-- Resize using Vim Keys and Arrows
local factor = 5
local left = { x = -10 * factor, y = 0, relative = true }
local right = { x = 10 * factor, y = 0, relative = true }
local up = { x = 0, y = -10 * factor, relative = true }
local down = { x = 0, y = 10 * factor, relative = true }

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.resize(left), { mouse = true })
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.resize(right), { mouse = true })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.resize(up), { mouse = true })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.resize(down), { mouse = true })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize(left), { mouse = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize(right), { mouse = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize(up), { mouse = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize(down), { mouse = true })

-- Swap active window using Vim Keys and arrows
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.swap({ direction = "down" }))

-- Move focus using Vim-style keys (H, J, K, L)
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Alternatively, use arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
