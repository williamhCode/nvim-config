require("Comment").setup({
  ignore = "^$"
})

local map = require("wily.utils.keymap").map

map("n", "<D-/>", "<Plug>(comment_toggle_linewise_current)")
map("x", "<D-/>", "<Plug>(comment_toggle_linewise_visual)")
