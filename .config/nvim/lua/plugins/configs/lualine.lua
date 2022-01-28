local theme = require'lualine.themes.onedark'

local fg = '#c678dd'
local bg = '#282c34'

theme.inactive = {
  a = { fg = fg, bg = bg, gui = 'bold' },
  b = { fg = bg, bg = fg },
  c = { fg = bg, bg = fg },
}

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      "help",
      "dashboard",
      "NvimTree",
      "terminal",
    }
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { right = '' }, right_padding = 2 },
    },
    lualine_b = {
      'branch'
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = " "
        }
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {
    lualine_a = {
      {
        'filename',
        separator = {
          -- left = '',
          right = ''
        },
        right_padding = 2,
        path = 1,
        symbols = {
          modified = " "
        }
      },
      -- { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false,   -- Show diagnostics even if there are none.
      }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      "tabs"
      -- { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  extensions = {
    "nvim-tree",
    "toggleterm"
  },
}

