local term = require("wily.utils.term")

term.set_build_cmd("make");
term.set_term_cmd("<leader>r", "zig build run")
