local M = {}
local default_opts = { noremap = true, silent = true }

local mappings = {
    -- exit insert mode
    -- { "i", "jk", "<ESC>", default_opts },

    -- no highlights
    { "n", "<ESC>", "<cmd> noh <CR>", default_opts },

    -- switch between windows
    -- { "n", "<A-h>", "<C-w>h", default_opts },
    -- { "n", "<A-l>", "<C-w>l", default_opts },
    -- { "n", "<A-j>", "<C-w>j", default_opts },
    -- { "n", "<A-k>", "<C-w>k", default_opts },

    { "n", "<leader>w", "<C-w>", default_opts },

    -- resize windows
    -- TODO: find a way to make these fucking logical becase these are just
    -- annoying to use
    -- also i dont want to use the plugin because fuck more plugins
    { "n", "<A-S-k>", "<cmd>resize -2<CR>", default_opts },
    { "n", "<A-S-j>", "<cmd>resize +2<CR>", default_opts },
    { "n", "<A-S-l>", "<cmd>vertical resize -2<CR>", default_opts },
    { "n", "<A-S-h>", "<cmd>vertical resize +2<CR>", default_opts },

    -- toggle numbers (with relative line numbers)
    { "n", "<leader>n", '<cmd>set rnu! nu!<CR>', default_opts },

    -- use j and k to move through wrapped lines
    -- gotten from https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
    { "n", "k", 'v:count ? "k" : "gk"', { silent = true, expr = true } },
    { "n", "j", 'v:count ? "j" : "gj"', { silent = true, expr = true } },

    -- does some pasting magic, got it from NvChad
    { "v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', default_opts },

    -- nvim tree
    { "n", "<leader>nt", "<cmd>NvimTreeToggle <CR>", default_opts },

    -- move text around
    { "x", "<S-j>", ":m '>+1<CR>gv-gv", default_opts },
    { "x", "<S-k>", ":m '<-2<CR>gv-gv", default_opts },

    -- stay in visual mode when indenting
    { "v", "<", "<gv", default_opts },
    { "v", ">", ">gv", default_opts },
}
require("utils").set_keymaps(mappings)

M.diagnostics = function()
    local diagnostics_opts = { silent = true, noremap = true }
    local diagnostics_mappings = {
        { "n", "<space>e", vim.diagnostic.open_float, diagnostics_opts },
        { "n", "]d", vim.diagnostic.goto_next, diagnostics_opts },
        { "n", "[d", vim.diagnostic.goto_prev, diagnostics_opts },
        { "n", "<space>q", "<cmd>TroubleToggle<CR>", diagnostics_opts },
    }
    require("utils").set_keymaps(diagnostics_mappings)
end

M.lsp = function(bufnr)
    local lsp_opts = { silent = true, noremap = true, buffer = bufnr }
    local lsp_mappings = {
        { "n", "<space>lD", vim.lsp.buf.declaration, lsp_opts },
        { "n", "<space>ld", vim.lsp.buf.definition, lsp_opts },
        { "n", "<space>li", vim.lsp.buf.implementation, lsp_opts },
        { "n", "<space>lk", vim.lsp.buf.hover, lsp_opts },
        { "n", "<space>lK", vim.lsp.buf.signature_help, lsp_opts },
        { "n", "<space>lt", vim.lsp.buf.type_definition, lsp_opts },
        { "n", "<space>ln", vim.lsp.buf.rename, lsp_opts },
        { "n", "<space>la", vim.lsp.buf.code_action, lsp_opts },
        { "n", "<space>lr", vim.lsp.buf.references, lsp_opts },
        {
            "n",
            "<space>f",
            function()
                vim.lsp.buf.format({
                    formatting_options = {
                        tabSize = 4,
                        insertSpaces = true,
                        trimTrailingWhitespace = true,
                    },
                })
            end,
            lsp_opts,
        },
    }
    require("utils").set_keymaps(lsp_mappings)
end

M.telescope = function()
    local built = require("telescope.builtin")
    local telescope_opts = { noremap = true, silent = true }
    local telescope_mappings = {
        -- find
        { "n", "<leader>ff", built.find_files, telescope_opts },
        { "n", "<leader>fw", built.live_grep, telescope_opts },
        { "n", "<leader>fb", built.buffers, telescope_opts },
        { "n", "<leader>fh", built.help_tags, telescope_opts },
        { "n", "<leader>fo", built.oldfiles, telescope_opts },
        { "n", "<leader>tk", built.keymaps, telescope_opts },

        -- git
        { "n", "<leader>cm", built.git_commits, telescope_opts },
        { "n", "<leader>gt", built.git_status, telescope_opts },

        -- pick a hidden term
        -- { "n", "<leader>pt", builtin.terms, telescope_opts },

        -- theme switcher
        -- { "n", "<leader>th", builtin.themes, telescope_opts },
    }
    require("utils").set_keymaps(telescope_mappings)
end

M.gitsigns = function()
    local gs = require("utils").get_package("gitsigns")
    local git_mappings = {
        -- Navigation
        { 'n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true } },

        { 'n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true } },

        -- Actions
        { { 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>' },
        { { 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>' },
        { 'n', '<leader>hS', gs.stage_buffer },
        { 'n', '<leader>hu', gs.undo_stage_hunk },
        { 'n', '<leader>hR', gs.reset_buffer },
        { 'n', '<leader>hp', gs.preview_hunk },
        { 'n', '<leader>hb', function() gs.blame_line { full = true } end },
        { 'n', '<leader>tb', gs.toggle_current_line_blame },
        { 'n', '<leader>hd', gs.diffthis },
        { 'n', '<leader>hD', function() gs.diffthis('~') end },
        { 'n', '<leader>td', gs.toggle_deleted },

        -- Text object
        { { 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>' },
    }

    require("utils").set_keymaps(git_mappings)
end

return M
