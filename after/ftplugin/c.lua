local term = require("wily.util.term")

term.set_build_cmd("gcc -Wall -Werror -std=c17 %")
term.set_run_cmd("./a.out")

-- set indentation to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
