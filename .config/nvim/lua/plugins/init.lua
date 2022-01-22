local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

   -- this is arranged on the basis of when a plugin starts
   use "nathom/filetype.nvim"
   use "nvim-lua/plenary.nvim"

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   use  {
     "navarasu/onedark.nvim",
     config = "require('plugins.configs.onedark')"
   }

   use {
      "kyazdani42/nvim-web-devicons",
      after = "onedark.nvim",
      config = "require('plugins.configs.icons')",
   }

   use {
     'nvim-lualine/lualine.nvim',
     after = "nvim-web-devicons",
     requires = 'kyazdani42/nvim-web-devicons',
     config = "require('plugins.configs.lualine')"
   }

   use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = "require('plugins.configs.others').blankline()",
   }

   use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = "require('plugins.configs.others').colorizer()",
   }

   use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = "require('plugins.configs.treesitter')",
   }

   -- git stuff
   use {
      "lewis6991/gitsigns.nvim",
      opt = true,
      config = "require('plugins.configs.gitsigns')",
      setup = function()
         require("core.utils").packer_lazy_load "gitsigns.nvim"
         require("core.mappings").gitsigns()
      end,
   }

   use {
     'sindrets/diffview.nvim',
     cmd = { "DiffviewOpen", "DiffviewFileHistory" },
     requires = 'nvim-lua/plenary.nvim',
     setup = function()
       require("core.mappings").diffview()
     end
   }

   -- lsp stuff

   use {
      "neovim/nvim-lspconfig",
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "nvim-lspconfig"
         -- reload the current file so lsp actually starts for it
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
          end, 1)
      end,
   }

   use {
     "williamboman/nvim-lsp-installer",
     after = "nvim-lspconfig",
     config = "require('plugins.configs.lspconfig')",
   }

   -- use {
   --    "ray-x/lsp_signature.nvim",
   --    after = "nvim-lspconfig",
   --    config = "require('plugins.configs.others').signature()",
   -- }

   use {
      "andymass/vim-matchup",
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "vim-matchup"
      end,
   }

   -- coq related in insert mode only
   use {
     'ms-jpq/coq_nvim',
     branch = "coq",
     event = "InsertEnter",
     setup = function()
       require('plugins.configs.coq')
     end,
   }

   use {
     'ms-jpq/coq.thirdparty',
     branch = "3p",
     after = "coq_nvim",
     config = "require('plugins.configs.coq_3p')"
   }

   -- misc plugins
   use {
      "windwp/nvim-autopairs",
      after = "coq_nvim",
      config = "require('plugins.configs.others').autopairs()",
   }

   use {
      "glepnir/dashboard-nvim",
      config = "require('plugins.configs.dashboard')",
      setup = function()
         require("core.mappings").dashboard()
      end,
   }

   use {
      "numToStr/Comment.nvim",
      module = "Comment",
      config = "require('plugins.configs.others').comment()",
      setup = function()
         require("core.mappings").comment()
      end,
   }

   -- file managing , picker etc
   use {
      "kyazdani42/nvim-tree.lua",
      -- only set "after" if lazy load is disabled and vice versa for "cmd"
      -- after = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = "require('plugins.configs.nvimtree')",
      setup = function()
         require("core.mappings").nvimtree()
      end,
   }

   use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = { "nvim-telescope/telescope-fzf-native.nvim" },
      config = "require('plugins.configs.telescope')",
      setup = function()
         require("core.mappings").telescope()
      end,
   }

   use {
     'nvim-telescope/telescope-fzf-native.nvim',
     run = 'make',
     after = "telescope.nvim"
   }

   use {
      "rcarriga/nvim-notify",
      after = { "telescope.nvim" },
      -- opt = true,
      config = "require('plugins.configs.nvim-notify')",
   }

   use {
      "DanilaMihailov/beacon.nvim",
      event = "VimEnter",
   }

   use {
      "beauwilliams/focus.nvim",
      cmd = {"FocusSplitNicely", "FocusSplitCycle", "FocusSplitLeft", "FocusSplitRight", "FocusSplitUp", "FocusSplitDown", "FocusMaximise"},
      config = "require('plugins.configs.focus')",
      setup = function()
         require("core.mappings").focus()
      end,
   }

   use {
     'luukvbaal/stabilize.nvim',
     config = "require('plugins.configs.stabilize')",
     setup = function()
       require("core.utils").packer_lazy_load "stabilize.nvim"
     end
   }

   use {
      "kazhala/close-buffers.nvim",
      cmd = {"BDelete", "BWipeout"},
      config = "require('plugins.configs.close_buffers')",
      setup = function()
         require("core.mappings").close_buffers()
      end,
   }

end)

