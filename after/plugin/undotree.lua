local width = vim.o.columns * 0.2
width = math.max(width, 30)
width = math.min(width, 40)
vim.g.undotree_SplitWidth = tostring(width)
vim.g.undotree_SetFocusWhenToggle = 1
-- vim.g.undotree_WindowLayout = 3

local sidebar = require("wily.utils.sidebar")
sidebar.set_cmds("<leader>u", vim.cmd.UndotreeToggle, vim.cmd.UndotreeHide)

vim.g.Undotree_CustomMap = function()
  vim.keymap.set("n", "l", "<plug>UndotreeEnter", { buffer = true })
end
