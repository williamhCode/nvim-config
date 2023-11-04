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
    "folke/tokyonight.nvim",
    { "projekt0n/github-nvim-theme" },
    { "olimorris/onedarkpro.nvim" },
    -- { "ellisonleao/gruvbox.nvim" },
    -- { "rebelot/kanagawa.nvim" },
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- UI
    {
      "goolord/alpha-nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    }, -- Greeter
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    }, -- Status Line
    -- Other
    -- {
    --   "norcalli/nvim-colorizer.lua",
    --   config = function()
    --     require("colorizer").setup({
    --       "*", "!lazy"
    --     })
    --   end
    -- }, -- highlight colors
    {
      "edluffy/hologram.nvim",
      enabled = false,
      config = function()
        require("hologram").setup({
          auto_display = true
        })
      end
    }, -- Images support

    ------------------- Coding --------------------
    { "numToStr/Comment.nvim" }, -- Commenting

    -- Language Support
    -- { "Vimjas/vim-python-pep8-indent" }, -- Cython Indentation
    { "rust-lang/rust.vim" },
    { "DingDean/wgsl.vim" },
    {
      "epwalsh/obsidian.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Lsp Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Null Ls
    { "jose-elias-alvarez/null-ls.nvim" },
    { "jay-babu/mason-null-ls.nvim" },

    -- Lsp Extras
    { "Issafalcon/lsp-overloads.nvim" }, -- Signature Help
    { "folke/neodev.nvim" },             -- Nvim Workspace
    {
      "j-hui/fidget.nvim",
      config = function()
        require("fidget").setup({
          window = {
            blend = 0
          }
        })
      end
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
      "nvim-treesitter/playground",
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
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      build = ":call mkdp#util#install()",
      config = function()
        vim.keymap.set("n", "<leader>tp", "<Plug>MarkdownPreviewToggle")
      end
    },

    -------------------- Editor --------------------
    -- Navigation
    -- File Tree
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      dev = false,
    },

    -- Fuzzy Finder
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      -- branch = "0.1.x",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim", build = "make"
    },

    {
      "ThePrimeagen/harpoon",
      dependencies = { "nvim-lua/plenary.nvim" },
    }, -- File Jumping
    -- { "preservim/tagbar" }, -- Tagbar

    -- Terminal
    {
      "akinsho/toggleterm.nvim",
      tag = "v2.6.0",
    },

    -- Git
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      -- config = true
    },
    { "sindrets/diffview.nvim" },

    -- Misc
    { "mbbill/undotree" },
    { "anuvyklack/hydra.nvim" },
    { "klen/nvim-config-local" },
  },
  {
    dev = {
      path = "/Users/williamhou/Documents/Coding/nvim-plugins",
    }
  }
)
