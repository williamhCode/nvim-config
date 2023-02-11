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
    "latex"
  },

  highlight = {
    enable = true,
    disable = { "latex" },
  },

  indent = {
    enable = true
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

