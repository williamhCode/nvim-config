vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
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

opt.guicursor:append("a:blinkon1")
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

vim.diagnostic.config({
  virtual_text = false,
})

vim.filetype.add({ extension = { wgsl = "wgsl" } })
