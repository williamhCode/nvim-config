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
    -- "folke/tokyonight.nvim",
    { "projekt0n/github-nvim-theme" },
    { "olimorris/onedarkpro.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- { "HUAHUAI23/nvim-quietlight" },
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

    -- {
    --   "vhyrro/luarocks.nvim",
    --   priority = 1001, -- this plugin needs to run before anything else
    --   opts = {
    --     rocks = { "magick" },
    --   },
    -- },
    -- {
    --   "3rd/image.nvim",
    --   dependencies = { "luarocks.nvim" },
    --   config = true
    -- },

    -- Other
    -- {
    --   "norcalli/nvim-colorizer.lua",
    --   config = function()
    --     require("colorizer").setup({
    --       "*", "!lazy"
    --     })
    --   end
    -- }, -- highlight colors

    ------------------- Coding --------------------
    { "numToStr/Comment.nvim" }, -- Commenting

    -- Language Support
    -- { "Vimjas/vim-python-pep8-indent" }, -- Cython Indentation
    -- { "rust-lang/rust.vim" },
    -- { "DingDean/wgsl.vim" },
    { "catgoose/vue-goto-definition.nvim" },

    -- {
    --   "epwalsh/obsidian.nvim",
    --   dependencies = { "nvim-lua/plenary.nvim" }
    -- },

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
    { "nvim-treesitter/playground", },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
      "m-demare/hlargs.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        max_lines = 1,
        -- enable = false,
      }
    },

    -- Indent Blankline
    -- {
    --   "lukas-reineke/indent-blankline.nvim",
    --   main = "ibl",
    --   opts = {
    --   }
    -- },

    -- Latex support
    {
      "lervag/vimtex",
      ft = "tex",
      config = function()
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_format_enabled = 1

        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_syntax_conceal_disable = 1
      end
    },

    -- Copilot
    { "zbirenbaum/copilot.lua" },
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      build = ":call mkdp#util#install()",
      -- config = function()
      --   vim.keymap.set("n", "<leader>tp", "<Plug>MarkdownPreviewToggle")
      -- end
    },

    {
      "gregorias/coerce.nvim",
      tag = "v1.1",
      config = true,
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
      -- branch = "0.1.x",
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
    -- {
    --   "rebelot/terminal.nvim",
    --   config = function()
    --     require("terminal").setup()
    --   end
    -- },

    -- Git
    -- {
    --   "NeogitOrg/neogit",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --   },
    --   config = true,
    --   -- cond = false,
    -- },
    { "sindrets/diffview.nvim" },

    -- Compile Mode
    -- {
    --   "ej-shafran/compile-mode.nvim",
    --   branch = "latest",
    --   -- or a specific version:
    --   -- tag = "v2.0.0"
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     { "m00qek/baleia.nvim", tag = "v1.3.0" },
    --   },
    --   config = true,
    -- },
    -- { "shoumodip/compile.nvim" },

    -- Misc
    { "mbbill/undotree" },
    { "nvimtools/hydra.nvim" },
    { "klen/nvim-config-local" },

    -- ssh clipboard
    { "ojroques/nvim-osc52" },
    -- { "wakatime/vim-wakatime" },
  },
  {
    dev = {
      path = "/Users/williamhou/Documents/Coding/nvim-related",
    }
  }
)
