local term = require("wily.utils.term")

term.set_term_cmd("<leader>r",
  "java -jar " ..
  vim.fn.resolve(
    "build/libs/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".jar"
  )
)

term.set_term_cmd("<leader>b", "./gradlew assemble")

-- set indentation to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
