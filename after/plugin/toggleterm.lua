require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.5
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,

  open_mapping = require("wily.utils.keymap").convert("<D-j>"),

  auto_scroll = false,

  highlights = {
    NormalFloat = {
      link = "NormalFloat"
    },
    FloatBorder = {
      link = "NormalFloat"
    },
  },

  direction = "float",
  -- direction = "horizontal",

  float_opts = {
    border = "solid",
    winblend = vim.o.winblend
  },

  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})
