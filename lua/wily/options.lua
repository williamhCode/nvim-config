vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

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

opt.mousescroll = "ver:1,hor:3"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.wrap = false
-- opt.hlsearch = false
opt.undofile = true
opt.updatetime = 250
opt.ttimeoutlen = 0

opt.conceallevel = 2

local function list(items, sep)
  return table.concat(items, sep or ",")
end

opt.fillchars = list {
  -- "vert:▏",
  "vert:│",
  "diff:╱",
  "foldclose:",
  "foldopen:",
  "fold: ",
  "msgsep:─",
}

opt.guicursor:append("a:blinkwait100-blinkoff700-blinkon700")
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

vim.diagnostic.config({
  virtual_text = false,
})

vim.filetype.add({ extension = { wgsl = "wgsl" } })


-- neovide option
if vim.g.neovide then
  -- UI and colors
  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end
  vim.g.neovide_transparency = 1.0
  -- vim.g.transparency = 1.0
  -- vim.g.neovide_background_color = "#282c34" .. alpha()

  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0

  -- inputs
  vim.g.neovide_input_macos_alt_is_meta = true
end
