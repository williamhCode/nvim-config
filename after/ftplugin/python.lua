local term = require("wily.utils.term")

term.set_term_cmd("<leader>r", "python \"%\"")
term.set_build_cmd("!make build")

vim.opt.colorcolumn = "88"
