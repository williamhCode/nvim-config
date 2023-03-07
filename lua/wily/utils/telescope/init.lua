local builtin = require("telescope.builtin")

local M = {}

M.better_find_files = function(opts)
  opts = opts or {}
  -- we only want to do it if we have a gitignore and no .git dir
  if vim.fn.filereadable(".gitignore") == 1 and vim.fn.isdirectory(".git/") == 0 and vim.fn.filereadable(".git") == 0 then
    opts.find_command = { "rg", "--files", "--glob", "--ignore-file", ".gitignore" }
  end
  builtin.find_files(opts)
end

return M
