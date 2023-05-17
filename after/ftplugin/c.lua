local term = require("wily.utils.term")

-- term.set_build_cmd("gcc -Wall -Werror -std=c17 %")
-- term.set_build_cmd("gcc -Wall -std=c17 %")
term.set_term_cmd("<leader>r", "./a.out")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.colorcolumn = "80"
