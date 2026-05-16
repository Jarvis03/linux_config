local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local themes = {
  "Tokyo Night",
  "Tokyo Night Storm",
  "Catppuccin Mocha",
  "Catppuccin Macchiato",
  "Gruvbox Dark",
  "Rosé Pine Moon",
}

local function current_theme(window)
  local overrides = window:get_config_overrides() or {}
  return overrides.color_scheme or config.color_scheme
end

wezterm.on("cycle-theme", function(window, _pane)
  local overrides = window:get_config_overrides() or {}
  local active = current_theme(window)
  local index = 1

  for i, name in ipairs(themes) do
    if name == active then
      index = i
      break
    end
  end

  overrides.color_scheme = themes[(index % #themes) + 1]
  window:set_config_overrides(overrides)
end)

config.automatically_reload_config = true
config.status_update_interval = 1000

config.default_prog = { "/usr/bin/zsh", "-l" }

config.font = wezterm.font_with_fallback({
  "DejaVu Sans Mono",
  "Noto Sans Mono CJK SC",
  "Noto Sans CJK SC",
})
config.font_size = 12.5
config.line_height = 1.1

config.color_scheme = "Tokyo Night"
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.integrated_title_button_style = "Gnome"
config.integrated_title_button_alignment = "Right"
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.tab_max_width = 32
config.canonicalize_pasted_newlines = "CarriageReturnAndLineFeed"
config.window_frame = {
  font = wezterm.font({ family = "DejaVu Sans", weight = "Bold" }),
  font_size = 11.0,
}

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
  { key = "t", mods = "LEADER", action = act.EmitEvent("cycle-theme") },
  { key = "PageUp", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
  { key = "PageDown", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(1) },
  { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "\\", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
  { key = "r", mods = "LEADER", action = wezterm.action.ReloadConfiguration },
}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.CopyTo("Clipboard"),
  },
}

config.window_padding = {
  left = 8,
  right = 8,
  top = 6,
  bottom = 6,
}

return config
