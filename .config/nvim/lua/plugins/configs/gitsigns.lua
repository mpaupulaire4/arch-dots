local present, gitsigns = pcall(require, "gitsigns")
if not present then
  return
end

gitsigns.setup {
  keymaps = {},
  current_line_blame = false,
  current_line_blame_opts = {
    ignore_whitespace = true
  },
  current_line_blame_formatter_opts = {
    relative_time = true
  },
}
