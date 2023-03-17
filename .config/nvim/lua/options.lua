local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

opt.laststatus = 3 -- global statusline

opt.clipboard = "unnamedplus"
opt.cursorline = true
-- make the cursor stay as block in insert mode
opt.guicursor = "i-ci-n-v-c-sm:block,ve:ver25,r-cr-o:hor20"
-- opt.background = "dark"
opt.winblend = require("utils").get_package("my-globals").winblend

opt.swapfile = false
opt.fileencoding = "utf-8"

-- Indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- opt.smartindent = true
-- opt.softtabstop = 4

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

-- folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = true

-- opt.showtabline = 0

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- opt.breakat = "!;:,.?"
opt.breakindent = true
opt.linebreak = true
opt.showbreak = " ~>  "

opt.textwidth = 80
opt.scrolloff = 20

-- opt.syntax = "on"
