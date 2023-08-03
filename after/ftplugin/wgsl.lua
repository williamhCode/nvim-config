vim.opt.commentstring = "//%s"

vim.opt_local.makeprg = [===[naga $* 2>&1 \| perl -pe 's/\x1b\[[0-9;]*[mG]//g']===]
vim.opt_local.errorformat = {
  "%Eerror: ",
  "%Eerror: %m",
  "%C   ┌─ %f:%l:%c",
}

require("wily.utils.term").set_build_cmd("make! %")
