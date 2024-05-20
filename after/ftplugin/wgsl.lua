vim.opt.commentstring = "//%s"

-- vim.opt_local.makeprg = [===[naga $* 2>&1 \| perl -pe 's/\x1b\[[0-9;]*[mG]//g']===]
-- vim.opt_local.errorformat = {
--   "%E%f:%l:%c error: %m",
--   "%C%p^",
-- }

-- require("wily.utils.term").set_build_cmd("make! %")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
