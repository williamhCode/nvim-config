require("oil").setup()
local map = require("wily.utils.keymap").map
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
