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
map({ "n", "x" }, "<leader>Y", "\"+Y", { remap = true })

-- file switch
map("n", "<C-_>", "<C-^>")

-- tab switch
map("n", "<leader>]", "<cmd>tabn<CR>")
map("n", "<leader>[", "<cmd>tabp<CR>")

-- better page up/down
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), mode, false)
end
map("n", "<C-u>", function()
  local height = math.floor(math.min(vim.fn.winheight(0) / 2, 20))
  feedkey(height .. "<C-u>", "n")
end)
map("n", "<C-d>", function()
  local height = math.floor(math.min(vim.fn.winheight(0) / 2, 20))
  feedkey(height .. "<C-d>", "n")
end)

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
map("n", "<leader>ds", vim.diagnostic.setqflist)

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

local term = require("wily.utils.term")
term.set_global_term_cmd("<leader>r", "make run")
term.set_global_term_cmd("<leader>b", "make build")

-- toggle options
local map_toggle_option = function(key, option)
  map("n", "<leader>t" .. key, function()
    vim.opt[option] = not vim.o[option]
    local message = vim.o[option] and "enabled" or "disabled"
    print(option .. " " .. message);
  end)
end

map_toggle_option("w", "wrap")
map_toggle_option("h", "hlsearch")
map_toggle_option("e", "equalalways")

map('n', '<leader>td', function()
  local virtual_text = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = virtual_text,
  })
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
