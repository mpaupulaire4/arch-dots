
require("indent_blankline").setup {
  indentLine_enabled = 1,
  char = "▏",
  -- show_current_context = true,
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "NvimTree",
  },
  buftype_exclude = { "terminal" },
}
