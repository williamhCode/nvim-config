require("oil").setup()
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
local map = require("wily.utils.keymap").map
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- map("n", "<D-o>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
