-- These are the basic's for using wezterm.
-- Mux is the mutliplexes for windows etc inside of the terminal
-- Action is to perform actions on the terminal
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- These are vars to put things in later (i dont use em all yet)
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- This is for newer wezterm vertions to use the config builder 
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Default config settings
-- Enable graphics and set terminal type
config.enable_kitty_graphics = true      -- If using graphics
config.enable_wayland = true             -- Set to true if using Wayland
config.use_ime = true                     -- Use Input Method Editor
config.term = "xterm-256color"            -- Ensure proper terminal type
config.enable_tab_bar = false

-- Color scheme, Wezterm has 100s of them you can see here:
-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 12
config.launch_menu = launch_menu
config.default_cursor_style = 'BlinkingBlock'
config.disable_default_key_bindings = true
--
-- this adds the ability to use ctrl+v to paste the system clipboard 
config.keys = {{ key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },}
config.mouse_bindings = mouse_bindings

-- -- There are mouse binding to mimc Windows Terminal and let you copy
-- -- To copy just highlight something and right click. Simple
-- mouse_bindings = {
--   {
--     event = { Down = { streak = 3, button = 'Left' } },
--     action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
--     mods = 'NONE',
--   },
--  {
--   event = { Down = { streak = 1, button = "Right" } },
--   mods = "NONE",
--   action = wezterm.action_callback(function(window, pane)
--    local has_selection = window:get_selection_text_for_pane(pane) ~= ""
--    if has_selection then
--     window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
--     window:perform_action(act.ClearSelection, pane)
--    else
--     window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
--    end
--   end),
--  },
-- }

-- This is used to make my foreground (text, etc) brighter than my background
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.2,
  brightness = 1.5,
}

-- This is used to set an image as my background 
config.background = {
  {
    source = { File = 'C:\\Users\\Ruben\\Desktop\\grass.png' }, -- Change this to the path of your image
    opacity = 1, -- Adjust opacity (0.0 to 1.0)
    hsb = { brightness = 0.01 }, -- Adjust brightness if needed
  }
}

-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the default when opening Wezterm
-- config.default_domain = 'WSL:Ubuntu'

return config
