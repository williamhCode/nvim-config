local map = vim.keymap.set

-- editing
map("n", "<M-s>a", "ggVG")
map({ "i", "c" }, "<M-bs>", "<C-w>")

-- better deleting/cutting
map({ "n", "x" }, "d", "\"_d")
map({ "n", "x" }, "D", "\"_D")

map({ "n", "x" }, "c", "\"_c")
map({ "n", "x" }, "C", "\"_C")

map("n", "x", "d")
map("n", "X", "D")
map("n", "xx", "dd")

-- system clipboard
map({ "n", "x" }, "<leader>p", "\"+p")
map({ "n", "x" }, "<leader>P", "\"+P")

map({ "n", "x" }, "<leader>y", "\"+y")
map({ "n", "x" }, "<leader>Y", "\"+Y")

-- file switch
map("n", "<C-_>", "<C-^>")

-- better find and replace, text editing
map("x", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
map("x", "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR>]])

map("n", "<leader>fr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("x", "<leader>fr", 'y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')

map("n", "<leader>fc",
  ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>")
map("x", "<leader>fc",
  [[y:,$s/<C-r>"/<C-r>"/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]])

map({ "n", "x" }, "<leader>cn", "*Ncgn", { remap = true })
map({ "n", "x" }, "<leader>cN", "*NcgN", { remap = true })

local setup_cr = function()
  map("n", "<CR>", ":nnoremap <buffer> <lt>Enter> @zn<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n",
    { buffer = true })
end

map({ "n", "x" }, "<leader>cq", function()
  setup_cr()
  vim.cmd(":norm *Nqz")
end)

-- quickfix shortcuts
map("n", "<C-j>", "<cmd>cnext<CR>zz")
map("n", "<C-k>", "<cmd>cprev<CR>zz")

-- indentation
map("i", "<M-s>[", "<C-d>")
map("i", "<M-s>]", "<C-t>")
map("n", "<M-s>[", "<<")
map("n", "<M-s>]", ">>")
map("x", "<M-s>[", "<gv")
map("x", "<M-s>]", ">gv")

-- terminal
map("t", "<Esc>", "<C-\\><C-n>")

-- toggle options
map("n", "<leader>tw", function()
  vim.opt.wrap = not vim.o.wrap
end)

map("n", "<leader>th", function()
  vim.opt.hlsearch = not vim.o.hlsearch
end)

-- hydra mappings
local Hydra = require('hydra')

Hydra({
  mode = "n",
  body = "<C-w>",
  heads = {
    { "+", "<C-w>+" },
    { "-", "<C-w>-" },
    { "<", "<C-w>3<" },
    { ">", "<C-w>3>" },
  }
})
