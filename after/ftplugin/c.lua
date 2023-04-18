local term = require("wily.utils.term")

-- term.set_build_cmd("gcc -Wall -std=c17 %")
term.set_build_cmd("make")
term.set_run_cmd(
  "./" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. "_test"
)

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.colorcolumn = "80"
