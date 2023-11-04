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

-- locationlist shortcuts
map("n", "<C-l>", "<cmd>lnext<CR>zz")
map("n", "<C-h>", "<cmd>lprev<CR>zz")

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

-- diagnostics
map("n", "<leader>df", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

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

Hydra({
  mode = "n",
  body = "z",
  heads = {
    { "h", "5zh" },
    { "l", "5zl" },
    { "H", "zH" },
    { "L", "zL" },
  }
})

local toggle_conf = function(key, option)
  return { key, function()
    vim.opt[option] = not vim.o[option]
  end, { desc = option, exit = true } }
end

Hydra({
  name = "Options",
  hint = [[
    ^ ^        Options
    ^
    _w_ %{wrap} wrap
    _v_ %{virtual_text} virtual_text
    _h_ %{hls} hlsearch
    _e_ %{ea} equalalways
    _r_ %{rnu} relative number        ^
  ]],
  config = {
    exit = true,
    invoke_on_body = true,
    hint = {
      position = "middle",
      funcs = {
        hls = function()
          return vim.o.hlsearch and "[x]" or "[ ]"
        end,
        ea = function()
          return vim.o.equalalways and "[x]" or "[ ]"
        end,
        virtual_text = function()
          return vim.diagnostic.config().virtual_text and "[x]" or "[ ]"
        end,
      }
    }
  },
  mode = "n",
  body = "<leader>o",
  heads = {
    { "w", function()
      if vim.o.wrap ~= true then
        vim.o.wrap = true
        vim.keymap.set("n", "k", function()
          return vim.v.count > 0 and "k" or "gk"
        end, { expr = true, desc = "k or gk" })
        vim.keymap.set("n", "j", function()
          return vim.v.count > 0 and "j" or "gj"
        end, { expr = true, desc = "j or gj" })
      else
        vim.o.wrap = false
        vim.keymap.del("n", "k")
        vim.keymap.del("n", "j")
      end
    end, { desc = "wrap", exit = true } },
    { "v", function()
      vim.diagnostic.config({
        virtual_text = not vim.diagnostic.config().virtual_text,
      })
    end, { desc = "virtual_text", exit = true } },
    toggle_conf("h", "hlsearch"),
    toggle_conf("e", "equalalways"),
    toggle_conf("r", "relativenumber"),
    { "<leader>o", nil, { desc = false, exit = true } },
    { "<Esc>", nil, { desc = false, exit = true } }
  }
})

-- ui's
map("n", "<leader>m", ":Mason<CR>", { silent = true})
map("n", "<leader>l", ":Lazy<CR>", { silent = true})
map("n", "<leader>g", ":Neogit<CR>", { silent = true})

