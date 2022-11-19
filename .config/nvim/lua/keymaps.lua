local M = {}
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

local mappings = {
    -- utils
    -- exit insert mode
    { 'i', 'jk', '<ESC>', opts },

    -- no highlights
    { 'n', '<ESC>', '<cmd> noh <CR>', opts },

    -- switch between windows
    { 'n', '<A-h>', '<C-w>h', opts },
    { 'n', '<A-l>', '<C-w>l', opts },
    { 'n', '<A-j>', '<C-w>j', opts },
    { 'n', '<A-k>', '<C-w>k', opts },

    -- resize windows
    { 'n', '<A-Up>', '<cmd>resize -2<CR>', opts},
    { 'n', '<A-Down>', '<cmd>resize +2<CR>', opts},
    { 'n', '<A-Left>', '<cmd>vertical resize -2<CR>', opts},
    { 'n', '<A-Right>', '<cmd>vertical resize +2<CR>', opts},

    -- toggle numbers {with relative line numbers}
    { 'n', '<leader>n', '<cmd>lua vim.cmd("set rnu! nu!") <CR>', opts },

    -- use j and k to move through wrapped lines
    -- gotten from https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
    { 'n', 'k', 'v:count ? "k" : "gk"', { silent = true, expr = true } },
    { 'n', 'j', 'v:count ? "j" : "gj"', { silent = true, expr = true } },

    -- does some pasting magic got it from NvChad
    { 'v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', opts },

    -- nvim tree
    { 'n', '<leader>t', "<cmd> NvimTreeToggle <CR>", opts },
}


M.toggle_nums = function()
    -- WHY THE FUCK DID IT TAKE ME SO LONG TO DO THIS????
    -- i mean its ugly as fuck but i dont care at this point, it works
    if vim.opt.rnu == true then
        vim.opt.rnu = false
    else
        vim.opt.rnu = false
    end
    if vim.opt.nu == true then
        vim.opt.nu = false
    else
        vim.opt.nu = false
    end
end

M.comment = {
    plugin = true,

    -- toggle comment in both modes
    n = {
        ["<leader>/"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "toggle comment",
        },
    },

    v = {
        ["<leader>/"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "toggle comment",
        },
    },
}


M.telescope = {
    plugin = true,

    n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
        ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

        -- git
        ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

        -- pick a hidden term
        ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

        -- theme switcher
        ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    },
}

-- see if we just remove this part of this file from our brains then the
-- keymapping looks fucking sexy as so from this comment downwards we are going
-- to completely forget about. :)
for _, v in pairs(mappings) do
    map(v[1], v[2], v[3], v[4])
end

-- except you return, you are nice, we won't forget about you
return M
