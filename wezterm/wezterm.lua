local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

config.default_prog = { "/bin/bash", "-l" }

config.font = wezterm.font_with_fallback({
  "DejaVu Sans Mono",
  "Noto Sans Mono CJK SC",
  "Noto Sans CJK SC",
})
config.font_size = 12.5
config.line_height = 1.1

config.color_scheme = "Builtin Solarized Dark"
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32

config.initial_cols = 120
config.initial_rows = 32
config.enable_scroll_bar = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
  { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
  { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "\\", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
  { key = "r", mods = "LEADER", action = wezterm.action.ReloadConfiguration },
}

config.window_padding = {
  left = 8,
  right = 8,
  top = 6,
  bottom = 6,
}

return config
