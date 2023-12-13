require("Comment").setup({
  ignore = "^$"
})

local map = vim.keymap.set
local convert = require("wily.utils.keymap").convert

map("n", convert("<D-/>"), "<Plug>(comment_toggle_linewise_current)")
map("x", convert("<D-/>"), "<Plug>(comment_toggle_linewise_visual)")
