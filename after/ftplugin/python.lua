local term = require("wily.util.term")

term.set_build_cmd("python setup.py build_ext --inplace")
term.set_run_cmd("python %")
