local M = {}

M.autopairs = function()
   local present1, autopairs = pcall(require, "nvim-autopairs")

   if present1 then
      autopairs.setup({fast_wrap = {}})
   end
end

M.blankline = function()
   require("indent_blankline").setup {
      indentLine_enabled = 1,
      char = "▏",
      filetype_exclude = {
         "help",
         "terminal",
         "dashboard",
         "packer",
         "lspinfo",
         "TelescopePrompt",
         "TelescopeResults",
         "",
      },
      buftype_exclude = { "terminal" },
      show_trailing_blankline_indent = false,
      -- show_first_indent_level = false,
   }
end

M.colorizer = function()
   local present, colorizer = pcall(require, "colorizer")
   if present then
      colorizer.setup({ "*" }, {
         RGB = true, -- #RGB hex codes
         RRGGBB = true, -- #RRGGBB hex codes
         names = false, -- "Name" codes like Blue
         RRGGBBAA = true, -- #RRGGBBAA hex codes
         rgb_fn = false, -- CSS rgb() and rgba() functions
         hsl_fn = false, -- CSS hsl() and hsla() functions
         css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
         css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn

         -- Available modes: foreground, background
         mode = "background", -- Set the display mode.
      })
      vim.cmd "ColorizerReloadAllBuffers"
   end
end

M.comment = function()
   local present, nvim_comment = pcall(require, "Comment")
   if present then
      nvim_comment.setup()
   end
end

-- M.signature = function()
--    local present, lspsignature = pcall(require, "lsp_signature")
--    if present then
--       lspsignature.setup {
--          bind = true,
--          doc_lines = 0,
--          floating_window = false,
--          fix_pos = true,
--          hint_enable = true,
--          hint_prefix = " ",
--          hint_scheme = "String",
--          hi_parameter = "Search",
--          max_height = 22,
--          max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
--          handler_opts = {
--             border = "single", -- double, single, shadow, none
--          },
--          zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
--          padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
--       }
--    end
-- end

return M
