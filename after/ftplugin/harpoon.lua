local ui = require("harpoon.ui")

for i = 1, 9 do
    vim.keymap.set('n', string.format("%d", i), function() ui.nav_file(i) end, { buffer = true })
end
