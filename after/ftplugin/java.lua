local term = require("wily.utils.term")

-- term.set_term_cmd("<leader>r",
--   "java -jar " ..
--   vim.fn.resolve(
--     "build/libs/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".jar"
--   )
-- )

term.set_term_cmd("<leader>r", "./gradlew run")
-- term.set_term_cmd("<leader>b", "./gradlew assemble")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
