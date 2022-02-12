local toggleterm = require('toggleterm')
local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "tab",
})

local lazydocker = Terminal:new({
  cmd = "lazydocker",
  hidden = true,
  direction = "tab",
})

function _G._lazygit_toggle()
  lazygit:toggle()
end

function _G._lazydocker_toggle()
  lazydocker:toggle()
end

toggleterm.setup {
  -- size can be a number or function which is passed the current terminal
  -- size = function(term)
  --   if term.direction == "horizontal" then
  --     return 50
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.4
  --   end
  -- end,
  open_mapping = [[<leader>t]],
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  hide_numbers = true, -- hide the number column in toggleterm buffers
  -- shade_filetypes = {},
  shade_terminals = true,
  -- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mappings = false, -- whether or not the open mapping applies in insert mode
  -- persist_size = true,
  direction = 'float',
  close_on_exit = false, -- close the terminal window when the process exits
  -- shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

