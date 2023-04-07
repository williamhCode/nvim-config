vim.keymap.set("n", "<leader>u", function()
  local width = vim.api.nvim_win_get_width(0) * 0.2
  width = math.max(width, 30)
  width = math.min(width, 40)
  vim.g.undotree_SplitWidth = width
  vim.cmd("UndotreeToggle")
end)
