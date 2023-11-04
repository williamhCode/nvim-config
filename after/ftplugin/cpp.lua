local term = require("wily.utils.term")
-- term.set_term_cmd("<leader>r", "make run")
-- term.set_term_cmd("<leader>b", "make build")

vim.keymap.set("n", "<leader>cr", ":py3f ~/.config/nvim/extern/clang-rename.py<cr>")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
