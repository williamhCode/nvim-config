require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.25
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.25
    end
  end,

  open_mapping = "<M-s>j",

  -- on_stdout = function(term, job, data, name)
  --   if term:is_open() then
  --     return
  --   end

  --   local str = data[1]
  --   if string.match(str, "build success[\r\n]") then
  --     print("Build Success ✅")
  --   elseif string.match(str, "build failed[\r\n]") then
  --     print("Build Failed ❌")
  --   elseif string.match(str, "runtime error[\r\n]") then
  --     print("Runtime Error ❌")
  --   end
  -- end,

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
