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
    -- "c_sharp",
    "bash",
    "cpp",
    "glsl",
    "latex",
    "make",
    "markdown",
    "markdown_inline",
    "vimdoc",
    -- "rust",
    -- "wgsl",
    -- "query",
    -- "javascript",
    -- "typescript",
    -- "vue",
    "css",
    "html",
    "nim",
    "gitignore",
    "json",
    "yaml",
  },

  highlight = {
    enable = true,
    disable = {
      -- "latex",
      "bash",
      "vim",
    },
    additional_vim_regex_highlighting = {
      -- "latex",
      "vim",
      "markdown",
    },
  },

  indent = {
    enable = true,
    -- disable = { "lua", "rust", "wgsl", "cpp", "c" },
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

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@attribute.outer",
        ["ia"] = "@attribute.inner",
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V",  -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      -- include_surrounding_whitespace = true,
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
      },
    },
  },
})
