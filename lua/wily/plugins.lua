local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
    { "olimorris/onedarkpro.nvim" },
    { "rose-pine/neovim", name = "rose-pine" },

    -- Devicons
    {
      "nvim-tree/nvim-web-devicons",
      priority = 1000,
      opts = {
          variant = "dark"
      }
    },

    -- UI
    {
      "goolord/alpha-nvim",
    }, -- Greeter
    {
      "nvim-lualine/lualine.nvim",
    }, -- Status Line

    ------------------- Coding --------------------
    { "numToStr/Comment.nvim" }, -- Commenting

    -- Change case
    {
      "gregorias/coerce.nvim",
      tag = "v1.1",
      config = true,
    },

    -- Install stuff
    {
      "williamboman/mason.nvim",
      config = true
    },

    -- Lsp Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Debugger Support
    { "mfussenegger/nvim-dap" },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" }
    },
    { "jay-babu/mason-nvim-dap.nvim" },

    { "Hoffs/omnisharp-extended-lsp.nvim" },

    -- Null Ls
    { "nvimtools/none-ls.nvim" },
    { "jay-babu/mason-null-ls.nvim" },

    -- Lsp Extras
    -- { "Issafalcon/lsp-overloads.nvim" }, -- Signature Help
    { "folke/neodev.nvim" },             -- Nvim Workspace
    { "j-hui/fidget.nvim", },            -- Lsp Progress

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
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
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "m-demare/hlargs.nvim" },
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        max_lines = 1,
        -- enable = false,
      }
    },

    -- Latex support
    {
      "lervag/vimtex",
      ft = "tex",
      config = function()
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_format_enabled = 1

        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_syntax_conceal = {
          accents = 1,
          ligatures = 1,
          cites = 1,
          fancy = 0,
          spacing = 1,
          greek = 1,
          math_bounds = 1,
          math_delimiters = 1,
          math_fracs = 0,
          math_super_sub = 0,
          math_symbols = 1,
          sections = 0,
          styles = 1,
        }
      end
    },

    -- Copilot
    { "zbirenbaum/copilot.lua" },
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      build = ":call mkdp#util#install()",
    },

    -------------------- Editor --------------------
    -- Navigation
    -- File Tree/Explorer
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
      dev = false,
    },
    {
      "stevearc/oil.nvim",
    },

    -- Fuzzy Finder
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- File Jumping
    {
      "cbochs/grapple.nvim",
    },

    -- Terminal
    {
      "akinsho/toggleterm.nvim",
      version = "*"
    },

    -- Git stuff
    { "sindrets/diffview.nvim" },

    -- Misc
    { "mbbill/undotree" },
    { "nvimtools/hydra.nvim" },
    { "klen/nvim-config-local" },
    { "wakatime/vim-wakatime" },
  },
  {
    dev = {
      path = "/Users/williamhou/Documents/Coding/nvim-related",
    }
  }
)
