local w = require("wezterm")
local c = w.config_builder()

c.window_background_opacity = 0.96
-- appearance
c.font = w.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" })
c.font_size = 16
c.color_scheme = "Catppuccin Mocha"
c.colors = {
    background = "#000",
    cursor_bg = "#9B96B5",
    cursor_fg = "#1a1a1e",
    cursor_border = "#ffffff",
}
c.window_padding = {
    left = 30,
    right = 30,
    top = 10,
    bottom = 5
}
--default_prog = { "cmd.exe", "-NoLogo" }, -- ← PowerShell siempre
c.default_prog = { "pwsh.exe", "-NoLogo" } -- ← PowerShell siempre
c.max_fps = 30
c.animation_fps = 30
c.front_end = "WebGpu"
c.prefer_egl = true


c.enable_tab_bar = false
c.window_close_confirmation = "NeverPrompt"
c.adjust_window_size_when_changing_font_size = true
c.enable_tab_bar = false
c.window_decorations = "RESIZE"
c.window_close_confirmation = "NeverPrompt"
c.automatically_reload_config = true
c.audible_bell = "Disabled"
c.adjust_window_size_when_changing_font_size = false
c.harfbuzz_features = { "calt=0" }

c.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

c.keys = {
  { 
    key ="m", 
    mods ="CMD",
    action = w.action.DisableDefaultAssignment
  },
	{ 
    key = "d", 
    mods = "CTRL|SHIFT", 
    action = w.action.SplitHorizontal({domain = "CurrentPaneDomain"}) 
  },
  { 
    key = "D", 
    mods = "CTRL|SHIFT",
    action = w.action.SplitVertical({ domain = "CurrentPaneDomain" }) 
  },
  {
    key = "w", 
    mods = "CTRL|SHIFT", 
    action = w.action.CloseCurrentPane({ confirm = true }) 
  },
  { 
    key = "t", 
    mods = "CTRL|SHIFT", 
    action = w.action.SpawnTab("CurrentPaneDomain") 
  },
  {
    key = "b", 
    mods = "CTRL|SHIFT", 
    action = w.action.RotatePanes("CounterClockwise") 
  },
  { 
    key = "n", 
    mods = "CTRL|SHIFT", 
    action = w.action.RotatePanes("Clockwise") 
  },
  {
    key = "h", 
    mods = "CTRL|SHIFT", 
    action = w.action.ActivatePaneDirection("Left") 
  },
  { 
    key = "j", 
    mods = "CTRL|SHIFT", 
    action = w.action.ActivatePaneDirection("Down") },
  { 
    key = "k", 
    mods = "CTRL|SHIFT", 
    action = w.action.ActivatePaneDirection("Up") },
  { 
    key = "l", 
    mods = "CTRL|SHIFT", 
    action = w.action.ActivatePaneDirection("Right") },
  }
return c
