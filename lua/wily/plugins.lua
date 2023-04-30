local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ----------------- Colors and UI ----------------
    -- Colorschemes
    -- { "navarasu/onedark.nvim" },
    { "olimorris/onedarkpro.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "rebelot/kanagawa.nvim" },

    -- UI
    {
      "goolord/alpha-nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    }, -- Greeter
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    }, -- Status Line
    -- {
    --   "utilyre/barbecue.nvim",
    --   version = "*",
    --   dependencies = {
    --     "SmiteshP/nvim-navic",
    --     "nvim-tree/nvim-web-devicons", -- optional dependency
    --   },
    --   opts = {
    --     show_dirname = false,
    --     show_basename = true,
    --     show_navic = false,
    --     show_modified = true,
    --   }
    -- }, -- Breadcrumbs

    -- Other
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({
          "*", "!lazy"
        })
      end
    }, -- highlight colors

    {
      'edluffy/hologram.nvim',
      enabled = false,
      config = function()
        require('hologram').setup({
          auto_display = true
        })
      end
    }, -- Images support

    ------------------- Coding --------------------
    -- General
    { "numToStr/Comment.nvim" }, -- Commenting
    { "Vimjas/vim-python-pep8-indent" }, -- Cython Indentation

    -- Lsp Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Null Ls
    { "jose-elias-alvarez/null-ls.nvim" },
    { "jay-babu/mason-null-ls.nvim" },

    -- Lsp Extras
    { "Issafalcon/lsp-overloads.nvim" }, -- Signature Help
    { "folke/neodev.nvim" }, -- Nvim Workspace
    {
      "j-hui/fidget.nvim",
      config = true
    }, -- Lsp Progress

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },
    {
      "m-demare/hlargs.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- Latex support
    {
      "lervag/vimtex",
      config = function()
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_format_enabled = 1
      end
    },

    -- Copilot
    { "zbirenbaum/copilot.lua" },

    -- Docs gen
    {
      "kkoomen/vim-doge",
      build = ":call doge#install()",
      config = function()
        vim.g.doge_doc_standard_python = "google"
      end
    },

    -------------------- Editor --------------------
    -- Navigation
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      dev = false,
    }, -- File Tree
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      branch = "0.1.x",
    }, -- Fuzzy Finder
    {
      "ThePrimeagen/harpoon",
      dependencies = { "nvim-lua/plenary.nvim" },
    }, -- File Jumping
    { "preservim/tagbar" }, -- Tagbar

    -- Terminal
    {
      "akinsho/toggleterm.nvim",
      tag = "2.3.0",
    },

    -- Undotree
    { "mbbill/undotree" },

    -- Keymap Modes
    { "anuvyklack/hydra.nvim" },

    -- Local Configuration
    { "klen/nvim-config-local" },

    -- ssh clipboard
    { "ojroques/nvim-osc52" },
  },
  {
    dev = {
      path = "/Users/williamhou/Documents/Coding/nvim-plugins",
    }
  }
)
