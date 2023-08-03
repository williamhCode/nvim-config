require("nvim-treesitter.configs").setup({
  playground = {
    enable = true,
  },
  ensure_installed = {
    "java",
    "python",
    "vim",
    "lua",
    "c",
    "c_sharp",
    "bash",
    "cpp",
    "glsl",
    "latex",
    "markdown",
    "markdown_inline",
    "vimdoc",
    "rust",
    "wgsl",
    "query"
  },

  highlight = {
    enable = true,
    disable = { "latex", "bash", "vim" },
    additional_vim_regex_highlighting = { "vim", "markdown" },
  },

  indent = {
    enable = { "lua", "python", "cpp" },
    -- disable = { "python", "lua", "rust", "wgsl", "cpp" },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
})
