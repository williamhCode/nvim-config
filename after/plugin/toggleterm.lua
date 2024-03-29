require("toggleterm").setup({
  -- size = function(term)
  --   if term.direction == "horizontal" then
  --     return vim.o.lines * 0.25
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.25
  --   end
  -- end,

  open_mapping = require("wily.utils.keymap").convert("<D-j>"),

  highlights = {
    NormalFloat = {
      link = "NormalFloat"
    },
    FloatBorder = {
      link = "NormalFloat"
    },
  },

  direction = "float",
  -- direction = "tab",

  float_opts = {
    border = "solid",
    -- winblend = 10
  },

  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})
