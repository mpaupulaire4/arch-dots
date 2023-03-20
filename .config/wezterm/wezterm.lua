local wezterm = require 'wezterm'
local binds = require 'keybinds'

local color_scheme = 'OneDark (base16)'

local theme = wezterm.color.get_builtin_schemes()[color_scheme]
-- The filled in variant of the < symbol
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = ' '

-- TODO: handle clicking/ opening links from terminal
-- TODO: look into better formating for tab bar and right status
--      https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
--      https://wezfurlong.org/wezterm/config/lua/config/tab_bar_style.html
--      https://wezfurlong.org/wezterm/config/lua/window/set_right_status.html
--      https://wezfurlong.org/wezterm/config/appearance.html#retro-tab-bar-appearance
-- TODO: Setup ssh
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = theme.background
    local background = theme.background
    local foreground = '#a0a8b9'

    if tab.is_active then
      foreground = background
      background = '#8ebd6b'
    elseif hover then
      background = '#3b3052'
    end

    local edge_foreground = background

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    -- local title = wezterm.truncate_right(tab.active_pane.foreground_process_name, max_width - 2)
    local title = tab.active_pane.foreground_process_name
    -- local title = tab.active_pane.title

    return {
      -- { Text = SOLID_RIGHT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Attribute = { Intensity = "Bold" } },
      { Text = ' ' .. title .. ' ', },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
return {
  color_scheme = color_scheme,
  font = wezterm.font_with_fallback {
    'Fira Code Nerd Font',
  },
  -- font = wezterm.font 'Fira Code',
  font_size = 14,
  disable_default_key_bindings = true,
  keys = binds.keys,
  key_tables = binds.key_tables,
  window_padding = {
    left = '0.25cell',
    right = '0.25cell',
    top = '0.25cell',
    bottom = '0.25cell',
  },
  -- window_background_opacity = 0.75,
  use_fancy_tab_bar = false,
  window_frame = {
    font = wezterm.font { family = 'Fira Code', weight = 'Bold' },
    font_size = 14.0,
    active_titlebar_bg = theme.background,
    inactive_titlebar_bg = theme.background,
  },

  -- colors = {
  --   tab_bar = {
  --     -- The color of the inactive tab bar edge/divider
  --     inactive_tab_edge = theme.background,
  --   },
  -- },
  colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = theme.background,

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = '#8ebd6b',
        -- The color of the text for the tab
        fg_color = theme.background,

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = 'Bold',
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      },

      -- The new tab button that let you create new tabs
      new_tab = {
        bg_color = theme.background,
        fg_color = '#8ebd6b',
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
      },
    },
  },

}
