-- g.dashboard_custom_section = {
--    a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
--    b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
--    c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
--    d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
--    e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
--    f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
-- }
--
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local logo = {
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "                                   ",
   "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
   "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
   "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
   "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
   "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
   "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
   "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
   " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
   " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
   "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
   "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
   "                                   ",
 }

dashboard.section.header.val = logo
dashboard.section.buttons.val = {
  -- dashboard.button("<Leader>ff", "  File Explorer"),
  dashboard.button("<Leader>ff", "  Find File"),
  dashboard.button("<Leader>fw", "  Find Word"),
  -- dashboard.button("<Leader>ps", "  Update plugins"),
  dashboard.button("q", "  Quit", ":qa<cr>")
}

alpha.setup(dashboard.opts)

-- vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
