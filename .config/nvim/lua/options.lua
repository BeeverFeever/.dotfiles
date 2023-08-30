local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

-- opt.laststatus = 3 -- global statusline

opt.clipboard = "unnamedplus"
opt.cursorline = true
-- make the cursor stay as block in insert mode
opt.guicursor = ""
opt.winblend = settings.winblend

opt.swapfile = false
opt.fileencoding = "utf-8"

-- Indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- disable nvim intro
-- opt.shortmess:append "sI"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.breakindent = true
opt.linebreak = true
opt.showbreak = " ~>  "

opt.textwidth = 80
opt.scrolloff = 20
