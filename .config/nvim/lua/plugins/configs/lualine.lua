-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
-- rst

require('lualine').setup({
  options = {
    theme = 'onedark',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {

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
    lualine_b = {},
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
    "chadtree"
  },
})

