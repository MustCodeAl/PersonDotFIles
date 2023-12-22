-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Dracula+'
config.default_cursor_style = 'SteadyBar'
config.font = wezterm.font { family = 'MesloLGS NF', weight = 'Regular' }
config.font_size = 13.0
config.scrollback_lines = 5000
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

config.window_background_opacity = 0.9

config.window_close_confirmation = 'NeverPrompt'
config.default_prog = { '/opt/homebrew/bin/zsh', '-l' }
-- and finally, return the configuration to wezterm
return config
 



