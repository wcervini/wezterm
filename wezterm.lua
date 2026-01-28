local w = require("wezterm")
local c = w.config_builder()

-- === Apariencia ===
c.color_scheme = "Catppuccin Mocha"
c.font = w.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" })
c.font_size = 14.0
c.colors = {
	background = "#000",
	cursor_bg = "#9B96B5",
	cursor_fg = "#1a1a1e",
	cursor_border = "#ffffff",
}
c.window_background_opacity = 0.96
c.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
c.window_decorations = "RESIZE"

-- === Rendimiento ===
c.front_end = "WebGpu"
c.max_fps = 60
c.animation_fps = 60

-- === Comportamiento ===
c.default_prog = { "pwsh.exe", "-NoLogo" }
c.window_close_confirmation = "NeverPrompt"
c.automatically_reload_config = true
c.audible_bell = "Disabled"
c.adjust_window_size_when_changing_font_size = false
c.harfbuzz_features = { "calt=0" }
c.use_fancy_tab_bar = true
c.show_tabs_in_tab_bar = false

-- === LEADER KEY ===
c.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

c.keys = {
	{ key = "m", mods = "CTRL|ALT", action = w.action.DisableDefaultAssignment },

	-- CAMBIAR ENTRE PANELES CON CTRL+F9
	--{ key = "F7", mods = "CTRL", action = w.action.ActivatePaneDirection("Next") },
	{ key = "Tab", mods = "CTRL", action = w.action.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = w.action.ActivateTabRelative(-1) },

	--{ key = "F9", mods = "CTRL", action = w.action.PaneSelect({}) },

	{ key = "r", mods = "LEADER", action = w.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = w.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "LEADER", action = w.action.CloseCurrentPane({ confirm = false }) },

	-- Navegación (HJKL)
	{ key = "h", mods = "LEADER", action = w.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = w.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = w.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = w.action.ActivatePaneDirection("Right") },

	-- REDIMENSIONAR (Leader + Flechas)
	{ key = "LeftArrow", mods = "LEADER", action = w.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "LEADER", action = w.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "LEADER", action = w.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "LEADER", action = w.action.AdjustPaneSize({ "Down", 5 }) },

	-- INTERCAMBIAR PANELES
	{ key = "x", mods = "LEADER", action = w.action.PaneSelect({ mode = "SwapWithActive" }) },
	{ key = "X", mods = "LEADER", action = w.action.RotatePanes("Clockwise") },
}

-- EVENTO PARA MAXIMIZAR AL INICIAR
w.on("gui-startup", function()
	local _, _, window = w.mux.spawn_window({})
	window:gui_window():maximize()
end)

return c
