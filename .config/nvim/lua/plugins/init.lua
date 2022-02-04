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
    'goolord/alpha-nvim',
    config = "require('plugins.configs.dashboard')",
    -- config = function ()
    --     require'alpha'.setup(require'alpha.themes.dashboard'.config)
    -- end
  }

   use {
     "kyazdani42/nvim-web-devicons",
     after = "onedark.nvim",
     config = "require('plugins.configs.icons')",
   }

   use {
     "stevearc/dressing.nvim",
     after = "onedark.nvim",
     config = "require('plugins.configs.dressing')",
   }

   use {
      "rcarriga/nvim-notify",
      after = "dressing.nvim",
      config = "require('plugins.configs.nvim-notify')",
   }

   use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = "require('plugins.configs.others').blankline()",
   }

   use {
      "mg979/vim-visual-multi",
      event = "BufRead",
      setup = "require('plugins.configs.visualmulti')",
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

   use {
     'nvim-lualine/lualine.nvim',
     event = "BufRead",
     requires = 'kyazdani42/nvim-web-devicons',
     config = "require('plugins.configs.lualine')"
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

   -- lsp stuff

   use {
      "neovim/nvim-lspconfig",
      event = "BufRead",
   }

   use {
     "williamboman/nvim-lsp-installer",
     after = "nvim-lspconfig",
     -- config = "require('plugins.configs.lspconfig')",
     config = function()
       require('plugins.configs.lspconfig')
       -- reload the current file so lsp actually starts for it
       vim.defer_fn(function()
         vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
       end, 1)
     end,
   }

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
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = "require('plugins.configs.nvimtree')",
      setup = function()
         require("core.mappings").nvimtree()
      end,
   }

   use {
     'nvim-telescope/telescope-fzf-native.nvim',
     opt = true,
     run = 'make',
      setup = function()
        require("core.utils").packer_lazy_load "telescope-fzf-native.nvim"
      end
   }

   use {
      "nvim-telescope/telescope.nvim",
      after = "telescope-fzf-native.nvim",
      requires = { "nvim-telescope/telescope-fzf-native.nvim" },
      config = "require('plugins.configs.telescope')",
      setup = function()
         require("core.mappings").telescope()
      end,
   }

   use {
      "DanilaMihailov/beacon.nvim",
      opt = true,
      setup = function()
        require("core.utils").packer_lazy_load "beacon.nvim"
      end
   }

   use {
      "beauwilliams/focus.nvim",
      opt = true,
      config = "require('plugins.configs.focus')",
      setup = function()
        require("core.utils").packer_lazy_load "focus.nvim"
        require("core.mappings").focus()
      end,
   }

   use {
     'luukvbaal/stabilize.nvim',
     opt = true,
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

   use {
     "akinsho/toggleterm.nvim",
     opt = true,
     config = "require('plugins.configs.toggleterm')",
     setup = function()
       require("core.utils").packer_lazy_load "toggleterm.nvim"
       require("core.mappings").toggleterm()
     end,
   }

   use {
    "elkowar/yuck.vim",
    ft = { "yuck" },
   }

   use {
      'ggandor/lightspeed.nvim',
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "lightspeed.nvim"
      end,
   }

end)

