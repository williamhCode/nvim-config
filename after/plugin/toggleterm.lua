require("toggleterm").setup({
  -- size = function(term)
  --   if term.direction == "horizontal" then
  --     return vim.o.lines * 0.25
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.25
  --   end
  -- end,

  open_mapping = "<M-s>j",

  highlights = {
    NormalFloat = {
      link = "NormalFloat"
    },
    FloatBorder = {
      link = "NormalFloat"
    },
  },

  direction = "float",

  float_opts = {
    border = "solid",
    -- winblend = 10
  },
})
