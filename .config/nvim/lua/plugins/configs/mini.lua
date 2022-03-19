require('mini.surround').setup {
  -- Number of lines within which surrounding is searched
  n_lines = 20,

  -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  highlight_duration = 1000,

  -- Pattern to match function name in 'function call' surrounding
  -- By default it is a string of letters, '_' or '.'
  funname_pattern = '[%w_%.]+',

  -- Module mappings. Use `'' (empty string) to disable one.
  mappings = {
    add = 'sa', -- Add surrounding
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding
    -- update_n_lines = 'sn', -- Update n_lines`
    update_n_lines = '',
  },
}

vim.g.minitrailspace_disable = true
require('mini.trailspace').setup {
  only_in_normal_buffers = true
}
vim.cmd [[ autocmd BufWrite * lua MiniTrailspace.trim() ]]

require('mini.bufremove').setup {}

require('mini.pairs').setup {}

require('mini.cursorword').setup {}

require('mini.indentscope').setup {
  draw = {
    -- Delay (in ms) between event and start of drawing scope indicator
    delay = 100,

    -- Animation rule for scope's first drawing. A function which, given next
    -- and total step numbers, returns wait time (in ms). See
    -- |MiniIndentscope.gen_animation()| for builtin options. To not use
    -- animation, supply `require('mini.indentscope').gen_animation('none')`.
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Textobjects
    object_scope = '',
    object_scope_with_border = '',

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = '',
    goto_bottom = '',
  },

  -- Options which control computation of scope. Buffer local values can be
  -- supplied in buffer variable `vim.b.miniindentscope_options`.
  options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = 'both',

    -- Whether to use cursor column when computing reference indent. Useful to
    -- see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,

    -- Whether to first check input line to be a border of adjacent scope.
    -- Use it if you want to place cursor on function header to get scope of
    -- its body.
    try_as_border = true,
  },

  -- Which character to use for drawing scope indicator
  symbol = '╎',
}

