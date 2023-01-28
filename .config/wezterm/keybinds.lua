local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('update-right-status', function(window)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

local function to_mode(mode, stay_open)
  return act.ActivateKeyTable {
    name = mode,
    timeout_milliseconds = 750,
    replace_current = true,
    until_unknown = true,
    one_shot = not stay_open
  }
end

return {
  keys = {
    { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
    { key = 'k', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackAndViewport' },
    -- { key = '"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
    -- { key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
    { key = 'PageUp', mods = 'NONE', action = act.ScrollByPage(-1) },
    { key = 'PageDown', mods = 'NONE', action = act.ScrollByPage(1) },
    { key = 't', mods = 'CTRL', action = to_mode('Command', true) },
  },

  key_tables = {
    ['Command'] = {
      { key = 't', mods = 'CTRL', action = act.TogglePaneZoomState },
      { key = 'd', mods = 'CTRL', action = act.ShowDebugOverlay },
      { key = 'n', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
      { key = 'c', mods = 'CTRL', action = act.ActivateCopyMode },
      { key = 's', mods = 'CTRL', action = act.Search { CaseSensitiveString = "" } },
      { key = 'Tab', action = act.ActivateTabRelative(1) },
      { key = 'Tab', mods = 'SHIFT', action = act.ActivateTabRelative(-1) },
      { key = 'Tab', mods = 'CTRL', action = act.MoveTabRelative(1) },
      { key = 'Tab', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
      { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
      { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
      { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
      { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
      { key = 'n', action = to_mode 'New Pane' },
      { key = 'r', action = to_mode('Resize Pane', true) },
    },
    ['New Pane'] = {
      { key = 'LeftArrow', action = act.SplitPane { direction = 'Left' } },
      { key = 'RightArrow', action = act.SplitPane { direction = 'Right' } },
      { key = 'UpArrow', action = act.SplitPane { direction = 'Up' } },
      { key = 'DownArrow', action = act.SplitPane { direction = 'Down' } },
    },
    ['Resize Pane'] = {
      { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    },
    ['copy_mode'] = {
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'F', mods = 'NONE', action = act.CopyMode { JumpBackward = { prev_char = false } } },
      { key = 'f', mods = 'NONE', action = act.CopyMode { JumpForward = { prev_char = false } } },
      { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
      { key = 'V', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Line' } },
      { key = 'v', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Cell' } },
      { key = 'v', mods = 'CTRL', action = act.CopyMode { SetSelectionMode = 'Block' } },
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'PageUp', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'PageDown', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      {
        key = 'y',
        mods = 'NONE',
        action = act.Multiple {
          { CopyTo = 'ClipboardAndPrimarySelection' },
          { CopyMode = 'Close' }
        }
      },
      { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    },

    search_mode = {
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
      { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
      { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
      {
        key = 'y',
        mods = 'NONE',
        action = act.Multiple {
          { CopyTo = 'ClipboardAndPrimarySelection' },
          { CopyMode = 'Close' }
        }
      },
    },

  }
}
