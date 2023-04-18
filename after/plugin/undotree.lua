local width = vim.go.columns * 0.2
width = math.max(width, 30)
width = math.min(width, 40)
vim.g.undotree_SplitWidth = tostring(width)
vim.g.undotree_SetFocusWhenToggle = 1

vim.keymap.set("n", "<leader>u", function()
  vim.cmd("UndotreeToggle")
end)
