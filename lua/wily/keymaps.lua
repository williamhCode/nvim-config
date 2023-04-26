local map = vim.keymap.set

-- editing
map("i", "<C-c>", "<Esc>")
map("n", "<M-s>a", "ggVG")
map({ "i", "c" }, "<M-bs>", "<C-w>", { remap = true })

-- better deleting/cutting
map({ "n", "x" }, "d", "\"_d")
map({ "n", "x" }, "D", "\"_D")

map({ "n", "x" }, "c", "\"_c")
map({ "n", "x" }, "C", "\"_C")

map({ "n", "x" }, "s", "\"_s")
map({ "n", "x" }, "S", "\"_S")

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

-- better page up/down
map("n", "<C-u>", "20<C-u>")
map("n", "<C-d>", "20<C-d>")

-- better find and replace, text editing
map("n", "<leader>fr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("x", "<leader>fr", 'y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')

map("n", "<leader>fc",
  ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>")
map("x", "<leader>fc",
  [[y:,$s/<C-r>"/<C-r>"/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]])

map("x", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
map("x", "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR>]])

map({ "n", "x" }, "<leader>cn", "*Ncgn", { remap = true })
map({ "n", "x" }, "<leader>cN", "*NcgN", { remap = true })

map({ "n", "x" }, "<leader>cq", function()
  map("n", "<CR>", "gno<ESC>@z", { buffer = true })
  vim.cmd("norm *Nqz")
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
map("t", "<C-w>", "<C-\\><C-n><C-w>")

-- toggle options
map("n", "<leader>tw", function()
  vim.opt.wrap = not vim.o.wrap
  print("wrap is " .. tostring(vim.o.wrap));
end)

map("n", "<leader>th", function()
  vim.opt.hlsearch = not vim.o.hlsearch
  print("hlsearch is " .. tostring(vim.o.hlsearch));
end)

map("n", "<leader>te", function()
  vim.opt.equalalways = not vim.o.equalalways
  print("equalalways is " .. tostring(vim.o.equalalways));
end)

local diagnostics_active = true
map('n', '<leader>td', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end)

-- user commands
vim.cmd([[
" remove trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command TW :call TrimWhitespace()
]])
-- set Q as wa then qa if wa success
vim.api.nvim_create_user_command("Q", "wa | qa", {})

-- hydra mappings
local Hydra = require("hydra")

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

