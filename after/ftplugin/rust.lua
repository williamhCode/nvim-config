vim.cmd("compiler cargo")

local term = require("wily.utils.term")
term.set_term_cmd("<leader>r", "cargo run")
term.set_term_cmd("<leader>b", "cargo build")

-- vim.keymap.set("n", "<leader>cc", function()
--   vim.cmd("wall")
--   vim.cmd("make! check")
-- end)
