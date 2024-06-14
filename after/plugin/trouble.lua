require("trouble").setup({
  focus = true,
  auto_preview = false,
  win = {
    size = 0.4
  },
  keys = {
    l = "jump",
    ["<tab>"] = "preview",
  },
})

local map = require("wily.utils.keymap").map
-- map("n", "<D-k>", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map("n", "<D-k>", "<cmd>Trouble diagnostics toggle<cr>")
