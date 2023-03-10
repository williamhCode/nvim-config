vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
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

opt.pumblend = 10
opt.pumheight = 12
opt.winblend = 10

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.wrap = false
-- opt.hlsearch = false
opt.undofile = true
opt.updatetime = 250
opt.guicursor:append("a:blinkon1")
-- opt.formatoptions:remove( { "c", "r", "o" } )

-- vim.cmd([[:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
--             \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
--             \,sm:block-blinkwait175-blinkoff150-blinkon175
-- ]])
