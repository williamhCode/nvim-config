local map = vim.keymap.set

vim.opt_local.scrolloff = 0
vim.opt_local.sidescrolloff = 0

-- reset <C-u> and <C-d> to default
local opts = { buffer = true }

map('n', '<C-u>', '<C-u>', opts)
map('n', '<C-d>', '<C-d>', opts)
