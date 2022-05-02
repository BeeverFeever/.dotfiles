local options = {
    relativenumber = false,			-- relative line numbers
    number = true,         	-- line numbers
    mouse = 'a',       	-- mouse controls
    cursorline = true, 	-- highlight line cursor is in
    numberwidth = 1,

    errorbells = false, 	-- auditory stimulation annoying
    ignorecase = true,
    scrolloff = 8,  	-- buffer starts scrolling 8 lines from the end of view

-- Tab settings
    tabstop = 4,			-- 4 tabstop
    shiftwidth = 4,
    expandtab = true,		-- tabs -> spaces
    smartindent = true,    -- nice indenting

    foldmethod = 'marker', -- set fold method to marker

-- backup/swap files
    swapfile = false, 	-- have files saved to swap
    undofile = true,		-- file undo history preserved outside current session

-- new win split options
    splitbelow = true,
    splitright = true,
    completeopt = 'menuone,noselect',

    termguicolors = true,

    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = false,
    pumheight = 10,
    timeoutlen = 1000,
    updatetime = 300,
    signcolumn = "yes",
    wrap = false,
    sidescrolloff = 8,
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
