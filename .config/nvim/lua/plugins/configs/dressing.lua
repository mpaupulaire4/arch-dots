local dressing = require('dressing')

dressing.setup {
  input = {
    enabled = true,
    insert_only = true,
  },
  select = {
    enabled = true,
    -- Priority list of preferred vim.select implementations
    backend = "telescope",

    -- Options for telescope selector
    telescope = require('telescope.themes').get_dropdown({}),
  },
}
