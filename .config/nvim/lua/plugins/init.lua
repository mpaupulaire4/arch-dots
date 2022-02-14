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

  use {
    "stevearc/dressing.nvim",
    config = "require('plugins.configs.dressing')",
  }

  use  {
    "navarasu/onedark.nvim",
    config = "require('plugins.configs.onedark')"
  }

  use {
    'goolord/alpha-nvim',
    config = "require('plugins.configs.dashboard')",
  }

  use {
    "kyazdani42/nvim-web-devicons",
    after = "onedark.nvim",
    config = "require('plugins.configs.icons')",
  }

  use {
    "rcarriga/nvim-notify",
    after = "dressing.nvim",
    config = "require('plugins.configs.nvim-notify')",
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = "require('plugins.configs.blankline')",
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
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }

  use {
    'RRethy/nvim-treesitter-textsubjects',
    after = 'nvim-treesitter'
  }

  use {
    'nvim-lualine/lualine.nvim',
    event = "BufRead",
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.configs.lualine')"
  }

  use {
    'echasnovski/mini.nvim',
    opt = true,
    branch = 'stable',
    config = "require('plugins.configs.mini')",
    setup = function()
      require("core.utils").packer_lazy_load "mini.nvim"
      require("core.mappings").mini()
    end,
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
    module = "lspconfig",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "nvim-lspconfig"
    end,
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-lspconfig",
  }

  use {
    "williamboman/nvim-lsp-installer",
    after = "cmp-nvim-lsp",
    -- config = "require('plugins.configs.lspconfig')",
    config = function()
      require('plugins.configs.lspconfig')
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,
  }


  use {
    "andymass/vim-matchup",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "vim-matchup"
    end,
  }

  -- completion related
  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = "require('plugins.configs.nvim-cmp')",
  }

  use {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    -- config = "require('plugins.configs.luasnip')",
  }

  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
  }

  use {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp",
  }

  -- misc plugins
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = "require('plugins.configs.others').autopairs()",
  }

  use {
    "numToStr/Comment.nvim",
    opt = true,
    config = "require('plugins.configs.comment')",
    setup = function()
      require("core.utils").packer_lazy_load "Comment.nvim"
    end
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
    'tknightz/telescope-termfinder.nvim',
    after = { "telescope.nvim" , "toggleterm.nvim"},
    config = function()
      require('telescope').load_extension("termfinder")
    end
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
    "tpope/vim-dadbod",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "vim-dadbod"
    end,
  }

  use {
    "kristijanhusak/vim-dadbod-ui",
    after = "vim-dadbod",
    setup = "require('plugins.configs.dadbod')",
  }

end)
