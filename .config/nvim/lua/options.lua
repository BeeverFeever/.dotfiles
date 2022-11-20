local opt = vim.opt
local g = vim.g

g.vim_version = vim.version().minor

-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly) 
if g.vim_version < 8 then
  g.did_load_filetypes = 0
  g.do_filetype_lua = 1
end

opt.laststatus = 3 -- global statusline
opt.showmode = true

opt.clipboard = "unnamedplus"
opt.cursorline = true
-- opt.background = "dark"
opt.winblend = require("utils").get_package("my-globals").winblend

opt.swapfile = false
opt.fileencoding = "utf-8"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = true

opt.showtabline = 0

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 2000

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

opt.breakat = "!;:,.?"
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "   "

opt.textwidth = 80
opt.scrolloff = 20

g.mapleader = " "
