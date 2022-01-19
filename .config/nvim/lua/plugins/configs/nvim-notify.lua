require("notify").setup({
  -- Animation style (see below for details)
  stages = "slide",
})

vim.notify = require('notify')

require("telescope").load_extension("notify")

