local term = require("wily.utils.term")

term.set_run_cmd(
  "java -jar " ..
  vim.fn.resolve("build/libs/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".jar")
)

term.set_build_cmd("./gradlew assemble")

-- set indentation to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
