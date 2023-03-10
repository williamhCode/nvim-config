require('nvim-treesitter.configs').setup({
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
    "help",
    "markdown",
  },

  highlight = {
    enable = true,
    disable = { "latex", "bash", "vim" },
    additional_vim_regex_highlighting = { "vim" },
  },

  indent = {
    enable = true,
    disable = { "python" },
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

