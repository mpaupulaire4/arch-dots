local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

ts_config.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  matchup = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
      },
    },
  },
  textsubjects = {
    enable = true,
    -- prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['ii'] = 'textsubjects-smart',
    },
  },
}
