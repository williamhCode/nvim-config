local term = require("wily.util.term")

term.set_build_cmd("python setup.py build_ext --inplace")

vim.opt.textwidth = 88
vim.opt.colorcolumn = "88"

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function()
--         vim.cmd("silent! !find . -name '*.pyx' -exec ctags {} +")
--     end
-- })

