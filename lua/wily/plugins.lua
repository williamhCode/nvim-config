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
  -- UI
  {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  ------------------- Coding --------------------
  -- General
  { "numToStr/Comment.nvim" }, -- Commenting
  { "Vimjas/vim-python-pep8-indent" }, -- Cython Indentation

  -- Lsp Support
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

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
  -- {
  --   "m-demare/hlargs.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   config = function()
  --     require('hlargs').setup({
  --       color = "#e86671"
  --     })
  --   end
  -- },

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

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    tag = "2.3.0",
  },

  -- Keymap Modes
  { "anuvyklack/hydra.nvim" },
})
