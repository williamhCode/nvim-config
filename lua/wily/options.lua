vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.background = "light"
-- opt.background = "dark"

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftround = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.scrolloff = 8
opt.sidescrolloff = 10

opt.splitright = true
opt.splitbelow = true

-- opt.pumblend = 10
opt.pumheight = 12
-- opt.winblend = 10

opt.ignorecase = true
opt.smartcase = true

opt.completeopt = "menu,menuone,noinsert,noselect"
opt.wildmode = "longest:full,full"

opt.mousescroll = { "ver:1", "hor:3" }
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.wrap = false
-- opt.hlsearch = false
opt.undofile = true
opt.updatetime = 250
opt.ttimeoutlen = 0

opt.grepprg = "rg --vimgrep --smart-case --hidden --glob=!.git/"

local function list(items, sep)
  return table.concat(items, sep or ",")
end

-- https://github.com/neovim/neovim/issues/15670
opt.fillchars = list {
  "diff:╱",
  "foldclose:",
  "foldopen:",
  "fold: ",
  "msgsep:─",
}

opt.guicursor = {
  "n-v-c-ci-sm:block",
  "i-ve:ver25",
  "r-cr-o:hor20",
  "a:blinkwait100-blinkoff700-blinkon700",
}

vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    }
  },
  severity_sort = true,
  jump = {
    float = { scope = "line" },
    wrap = true,
  }
})

vim.filetype.add({ extension = { wgsl = "wgsl" } })

-- neovide option
if vim.g.neovide then
  -- UI and colors
  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end
  vim.g.neovide_transparency = 0.92
  -- vim.g.transparency = 0.92
  -- vim.g.neovide_background_color = "#282c34" .. alpha()

  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0

  -- inputs
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  -- vim.g.neovide_input_ime = false
end

if vim.g.neogurt then
  local bg_color
  if vim.o.background == "light" then
    bg_color = 0xfaf4ed
  else
    bg_color = 0x282c34
  end

  vim.g.neogurt_opts = {
    vsync = true,
    high_dpi = true,
    borderless = true,
    blur = 20,

    margin_top = 0,
    margin_bottom = 5,
    margin_left = 5,
    margin_right = 5,

    mac_opt_is_meta = true,
    cursor_idle_time = 10,
    scroll_speed = 1,

    bg_color = bg_color,
    opacity = 0.92,

    gamma = 1.7,

    max_fps = 60,
  }
end

opt.linespace = 0
opt.guifont = "JetBrains Mono Medium,PingFang TC,Symbols Nerd Font:h15"
