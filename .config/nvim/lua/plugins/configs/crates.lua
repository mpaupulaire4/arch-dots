require('crates').setup {

}

local cmp = require('cmp')
require('cmp').setup.filetype('toml', {
  sources = cmp.config.sources {
    { name = 'crates' },
  }
})
