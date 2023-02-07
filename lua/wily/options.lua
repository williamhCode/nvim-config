vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true

opt.number = true
opt.relativenumber = true

opt.scrolloff = 8
opt.sidescrolloff = 10

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
opt.cursorline = true
opt.showmode = false
opt.wrap = false
opt.hlsearch = false
opt.undofile = true
opt.updatetime = 200
opt.guicursor:append("a:blinkon1")

