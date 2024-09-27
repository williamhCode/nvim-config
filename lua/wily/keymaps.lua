-- see all modes
-- :h map-table
local map = require("wily.utils.keymap").map

-- editing
map("n", "<D-a>", "ggVG")
map({ "i", "c" }, "<M-bs>", "<C-w>", { remap = true })

-- differentiate between deleting and cutting
map({ "n", "x" }, "d", "\"_d")
map({ "n", "x" }, "D", "\"_D")

map({ "n", "x" }, "c", "\"_c")
map({ "n", "x" }, "C", "\"_C")

map({ "n", "x" }, "s", "\"_s")
map({ "n", "x" }, "S", "\"_S")

map("n", "x", "d")
map("n", "X", "D")
map("n", "xx", "dd")

-- cmd line
vim.cmd [[set cedit=\<C-Y>]]
map("c", "<C-a>", "<Home>")
map("c", "<C-b>", "<Left>")
map("c", "<C-d>", "<Del>")
map("c", "<C-e>", "<End>")
map("c", "<C-f>", "<Right>")
map("c", "<C-n>", "<Down>")
map("c", "<C-p>", "<Up>")
map("c", "<M-b>", "<S-Left>")
map("c", "<M-f>", "<S-Right>")

-- pasting
map({ "i", "c" }, "<C-v>", "<C-r>\"")
map("t", "<C-v>", "<C-\\><C-n>pi")

if vim.g.neogui then
  map({ "i", "c" }, "<D-v>", "<C-r>+")
  map("t", "<D-v>", "<C-\\><C-n>\"+pi")

  map({ "i", "c", "t" }, "<D-bs>", "<C-u>")
end

-- system clipboard
map({ "n", "x" }, "<leader>p", "\"+p")
map({ "n", "x" }, "<leader>P", "\"+P")

map({ "n", "x" }, "<leader>y", "\"+y")
map({ "n", "x" }, "<leader>Y", "\"+Y", { remap = true })

map({ "n", "x" }, "<leader>x", "\"+x")
map({ "n", "x" }, "<leader>X", "\"+X", { remap = true })

-- file switch
if vim.g.neovide or vim.g.neogui then
  map("n", "<C-->", "<C-^>")
else
  map("n", "<C-_>", "<C-^>")
end

-- tab
-- map("n", "<leader>te", "<cmd>tabe<CR>")
-- map("n", "<leader>tq", "<cmd>tabc<CR>")
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
map("n", "<C-j>", "<cmd>cnext<CR>")
map("n", "<C-k>", "<cmd>cprev<CR>")
-- map("n", "<C-j>", "<cmd>NextError<CR>")
-- map("n", "<C-k>", "<cmd>PrevError<CR>")
-- map("n", "<leader>qs", vim.diagnostic.setqflist)

-- locationlist shortcuts
map("n", "<C-l>", "<cmd>lnext<CR>zz")
map("n", "<C-h>", "<cmd>lprev<CR>zz")

-- indentation
map("i", "<D-[>", "<C-d>")
map("i", "<D-]>", "<C-t>")
map("n", "<D-[>", "<<")
map("n", "<D-]>", ">>")
map("x", "<D-[>", "<gv")
map("x", "<D-]>", ">gv")

-- terminal
map("t", "<C-\\>", "<C-\\><C-n>")
-- map("t", "<C-w>", "<C-\\><C-n><C-w>")

local term = require("wily.utils.term")
term.set_global_term_cmd("<leader>r", "make run")
term.set_global_build_cmd("<leader>b", "make")
map("n", "<leader>j", function()
  term.toggle_current_make_term()
end)
-- map("n", "<leader>q", function()
--   term.close_current_make_term()
-- end)

-- diagnostics
map("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end)
map("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end)

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
vim.api.nvim_create_user_command("Bd", "%bd|e#|bd#", {})

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

    -- apply to all windows if the option is window scoped
    local option_scope = vim.api.nvim_get_option_info2(option, {}).scope
    if option_scope == "win" then
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        vim.api.nvim_set_option_value(option, vim.o[option], { win = win })
      end
    end
  end, { desc = option, exit = true } }
end

local auto_trigger = false

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
    _a_ %{auto_trigger} auto trigger  ^
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
        auto_trigger = function()
          return auto_trigger and "[x]" or "[ ]"
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
    { "a", function()
      auto_trigger = not auto_trigger
      require("copilot.suggestion").toggle_auto_trigger()
      print("auto_trigger: " .. (auto_trigger and "on" or "off"))
    end, { desc = "auto_trigger", exit = true } },

    { "<leader>o", nil, { desc = false, exit = true } },
    { "<Esc>", nil, { desc = false, exit = true } },
  }
})

-- ui's
map("n", "<leader>M", "<Cmd>Mason<CR>")
map("n", "<leader>L", "<Cmd>Lazy<CR>")
map("n", "<leader>k", function()
  local height = math.floor(vim.o.lines * 0.4)
  vim.cmd("botright copen " .. height)
end)
map("n", "<leader>gg", "<Cmd>Neogit<CR>")

-- neogui
if vim.g.neogui then
  -- all modes
  local mode = {"", "!", "t", "l"};
  map(mode, "<D-=>", "<cmd>Neogui font_size_change 1<cr>")
  map(mode, "<D-->", "<cmd>Neogui font_size_change -1<cr>")
  map(mode, "<D-0>", "<cmd>Neogui font_size_reset<cr>")

  map(mode, "<D-l>", "<cmd>Neogui session_prev<cr>")
  map(mode, "<D-r>", "<cmd>Neogui session_select sort=time<cr>")

  map(mode, "<D-f>", function()
    local cmd = [[
    echo "$({
      echo ~/;
      echo ~/.dotfiles;
      echo ~/.config/nvim; 
      echo ~/Documents/Notes;
      echo ~/Documents/Work/Resume stuff;
      find ~/Documents/Coding -mindepth 2 -maxdepth 2 -type d; 
    })"
    ]]
    local output = vim.fn.system(cmd)

    local dirs = {}
    for dir in string.gmatch(output, "([^\n]+)") do
      table.insert(dirs, dir)
    end

    vim.ui.select(dirs, {
      prompt = "Choose a directory:",
    }, function(choice)
      if choice == nil then return end
      local dir = choice
      local fmod = vim.fn.fnamemodify
      local name = fmod(fmod(dir, ":h"), ":t") .. "/" .. fmod(dir, ":t")
      vim.g.neogui_cmd("session_new", { dir = dir, name = name })
    end)
  end)

  vim.g.neogui_startup = function()
    local cmd = [[
    echo "$({
      echo ~/;
      echo ~/.dotfiles;
      echo ~/.config/nvim; 
      echo ~/Documents/Notes;
      echo ~/Documents/Work/Resume stuff;
      find ~/Documents/Coding -mindepth 2 -maxdepth 2 -type d; 
    })"
    ]]
    local output = vim.fn.system(cmd)

    local dirs = {}
    for dir in string.gmatch(output, "([^\n]+)") do
      table.insert(dirs, dir)
    end

    vim.ui.select(dirs, {
      prompt = "Choose a directory:",
    }, function(choice)
      if choice == nil then return end
      local dir = choice
      local fmod = vim.fn.fnamemodify
      local name = fmod(fmod(dir, ":h"), ":t") .. "/" .. fmod(dir, ":t")
      vim.g.neogui_cmd("session_new", { dir = dir, name = name, switch_to = false })
      vim.g.neogui_cmd("session_kill")
    end)
  end
end
