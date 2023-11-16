local opt = vim.opt
local g = vim.g

g.mapleader = ' '

g.netrw_banner = 0			-- gets rid of the annoying banner for netrw
g.netrw_browse_split=4		-- open in prior window
g.netrw_altv = 1			   -- change from left splitting to right splitting
g.netrw_liststyle=3			-- tree style view in netrw

opt.laststatus = 3 -- global statusline

opt.clipboard = "unnamedplus"
opt.cursorline = true
-- make the cursor stay as block in insert mode
opt.guicursor = ""
opt.winblend = settings.winblend

opt.swapfile = false
opt.fileencoding = "utf-8"

-- Indenting
opt.tabstop = 3
opt.softtabstop = 3
opt.shiftwidth = 3
opt.expandtab = true
opt.smartindent = true

opt.smartcase = true
-- opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- disable nvim intro
-- opt.shortmess:append "sI"

-- opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 300 -- I am fast
opt.undofile = true

opt.breakindent = true
opt.linebreak = true
opt.showbreak = " ~>  "

opt.textwidth = 80
opt.scrolloff = 10
