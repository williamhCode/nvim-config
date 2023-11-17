require("harpoon").setup({
  -- tabline = false,
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local map = vim.keymap.set

map("n", "<leader>a", mark.add_file)
map("n", "<leader>h", ui.toggle_quick_menu)
for i = 1, 9 do
  map("n", string.format("<leader>%d", i), function() ui.nav_file(i) end)
end
