local term = require("wily.util.term")

term.set_run_cmd(
  "java -jar " ..
  vim.fn.resolve("build/libs/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".jar")
)

term.set_build_cmd("./gradlew assemble")
