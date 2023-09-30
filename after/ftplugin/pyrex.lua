vim.opt.textwidth = 88
vim.opt.colorcolumn = "88"

local term = require("wily.utils.term")
term.set_build_cmd("!make build")
