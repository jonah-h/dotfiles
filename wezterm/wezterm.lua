-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true

-- remove border
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- font
config.font = wezterm.font_with_fallback {
    "Fira Code SimpleR", -- my patched version
    "IosevkaTerm Nerd Font",
    "Font Awesome 6 Pro",
}
config.font_size = 14

config.dpi = 188


-- color scheme
config.color_scheme = "Gruvbox Dark (Gogh)"

-- and finally, return the configuration to wezterm
return config
