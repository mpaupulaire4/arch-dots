local utils = require "core.utils"

local map = utils.map
local cmd = vim.cmd

local M = {}

-- these mappings will only be called during initialization
M.misc = function()
  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", '"_dP')

  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  -- empty mode is same as using :map
  -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
  map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

  -- use ESC to turn off search highlighting
  map("n", "<Esc>", ":noh <CR>")

  -- yank from current cursor to end of line
  -- map("n", "Y", "yg$")

  -- don't yank text on cut ( x )
  -- map({ "n", "v" }, "x", '"_x')

  -- don't yank text on delete ( dd )
  map({ "n", "v" }, "d", '"_d')

  -- navigation within insert mode
  -- map("i", "<Home>", "<ESC>^i")

  -- easier navigation between windows
  map("n", "<C-A-Left>",  "<C-w>h")
  map("n", "<C-A-Right>", "<C-w>l")
  map("n", "<C-A-Up>",    "<C-w>k")
  map("n", "<C-A-Down>",  "<C-w>j")

  map("n", "<leader>x", ":lua require('core.utils').close_buffer() <CR>") -- close  buffer
  map("n", "<C-a>", ":%y+ <CR>") -- copy whole file content
  map("n", "<S-t>", ":enew <CR>") -- new buffer
  map("n", "<C-t>b", ":tabnew <CR>") -- new tabs
  -- map("n", maps.misc.line_number_toggle, ":set nu! <CR>") -- toggle numbers
  map("n", "<C-s>", ":w <CR>") -- ctrl + s to save file
  map("i", "<C-s>", "<Esc>:w <CR>") -- ctrl + s to save file

  -- Move Line(s) Up
  map("n", "<A-Up>", ":m .-2<CR>==")
  map("i", "<A-Up>", "<Esc>:m .-2<CR>==i")
  map("v", "<A-Up>", ":m '<-2<CR>gv=gv")
  -- Move Line(s) Down
  map("n", "<A-Down>", ":m .+1<CR>==")
  map("i", "<A-Down>", "<Esc>:m .+1<CR>==i")
  map("v", "<A-Down>", ":m '>+1<CR>gv=gv")

  -- terminal mappings --
  -- get out of terminal mode
  map("t", "<S-Esc>", "<C-\\><C-n>")
  -- hide a term from within terminal mode
  map("t", "<C-Esc>", "<C-\\><C-n> :lua require('core.utils').close_buffer() <CR>")
  -- pick a hidden term
  map("n", "<leader>T", ":Telescope terms <CR>")
  -- Open terminals
  -- TODO this opens on top of an existing vert/hori term, fixme
  -- map("n", term_maps.new_horizontal, ":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>")
  -- map("n", term_maps.new_vertical, ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>")
  map("n", "<leader>t", ":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>")
  -- terminal mappings end --

  -- Add Packer commands because we are not loading it at startup
  cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
  cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
  cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
  cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
  cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
  cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

end

-- below are all plugin related mappings

M.tabline = function()
   map("n", "<TAB>", ":TablineBufferNext <CR>")
   map("n", "<S-TAB>", ":TablineBufferPrevious <CR>")
end

M.comment = function()
   map("n", "<leader>/", ":lua require('Comment.api').toggle_current_linewise()<CR>")
   map("v", "<leader>/", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
end

M.dashboard = function()
   map("n", "<leader>bm", ":DashboardJumpMarks <CR>")
   map("n", "<leader>fn", ":DashboardNewFile <CR>")
   map("n", "<leader>db", ":Dashboard <CR>")
   map("n", "<leader>l", ":SessionLoad <CR>")
   map("n", "<leader>s", ":SessionSave <CR>")
end

M.lspconfig = function()
   local m = {
      declaration = "gD",
      definition = "gd",
      hover = "K",
      implementation = "gi",
      signature_help = "gk",
      add_workspace_folder = "<leader>wa",
      remove_workspace_folder = "<leader>wr",
      list_workspace_folders = "<leader>wl",
      type_definition = "<leader>D",
      rename = "<leader>rn",
      code_action = "<leader>ca",
      references = "gr",
      float_diagnostics = "ge",
      goto_prev = "[d",
      goto_next = "]d",
      set_loclist = "<leader>q",
      formatting = "<leader>fm",
   }

   -- See `:help vim.lsp.*` for documentation on any of the below functions
   map("n", m.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>")
   map("n", m.definition, "<cmd>lua vim.lsp.buf.definition()<CR>")
   map("n", m.hover, "<cmd>lua vim.lsp.buf.hover()<CR>")
   -- map("n", m.implementation, "<cmd>lua vim.lsp.buf.implementation()<CR>")
   -- map("n", m.signature_help, "<cmd>lua vim.lsp.buf.signature_help()<CR>")
   -- map("n", m.add_workspace_folder, "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
   -- map("n", m.remove_workspace_folder, "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
   -- map("n", m.list_workspace_folders, "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
   -- map("n", m.type_definition, "<cmd>lua vim.lsp.buf.type_definition()<CR>")
   -- map("n", m.rename, "<cmd>lua vim.lsp.buf.rename()<CR>")
   map("n", m.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>")
   map("n", m.references, "<cmd>lua vim.lsp.buf.references()<CR>")
   -- map("n", m.float_diagnostics, "<cmd>lua vim.diagnostic.open_float()<CR>")
   -- map("n", m.goto_prev, "<cmd>lua vim.diagnostic.goto_prev()<CR>")
   -- map("n", m.goto_next, "<cmd>lua vim.diagnostic.goto_next()<CR>")
   -- map("n", m.set_loclist, "<cmd>lua vim.diagnostic.setloclist()<CR>")
   -- map("n", m.formatting, "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

M.nvimtree = function()
   map("n", "<C-n>", ":NvimTreeToggle <CR>")
   -- map("n", plugin_maps.nvimtree.focus, ":NvimTreeFocus <CR>")
end

M.telescope = function()
   map("n", "<leader>fb", ":Telescope buffers <CR>")
   map("n", "<leader>ff", ":Telescope find_files <CR>")
   map("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
   -- map("n", "<leader>", ":Telescope git_commits <CR>")
   -- map("n", "<leader>", ":Telescope git_status <CR>")
   -- map("n", "<leader>", ":Telescope help_tags <CR>")
   map("n", "<leader>fw", ":Telescope live_grep <CR>")
   map("n", "<leader>fo", ":Telescope oldfiles <CR>")
end

return M
