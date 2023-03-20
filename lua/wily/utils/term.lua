local map = vim.keymap.set
local toggleterm = require("toggleterm")

local M = {}

M.set_build_cmd = function(cmd)
  map('n', "<leader>b", function()
    vim.cmd("wall")
    toggleterm.exec(vim.fn.expandcmd(cmd), vim.v.count)
  end, { buffer = true })
end

M.set_run_cmd = function(cmd)
  map('n', "<leader>r", function()
    vim.cmd("wall")
    toggleterm.exec(vim.fn.expandcmd(cmd), vim.v.count)
  end, { buffer = true })
end

return M
