local g = vim.g

g.VM_theme = "nord"
g.VM_default_mappings = 0
g.VM_maps = {
  ['Find Under']         = '<C-d>', -- replace C-n
  ['Find Subword Under'] = '<C-d>', -- replace visual C-n
  ["Undo"]               = 'u',
  ["Redo"]               = '<C-r>',
  ["Add Cursor Down"]    = '<C-Down>',
  ["Add Cursor Up"]      = '<C-Up>',
}
