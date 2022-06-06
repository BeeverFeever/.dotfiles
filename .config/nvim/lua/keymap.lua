local function map(mode, bind, exec, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, bind, exec, opts)
end

local M = {}
local opts = { noremap = true, silent = true } --empty opt for maps with no extra options

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " " -- Map leader key to space
vim.g.maplocalleader = " "

-- Modes --
--  normal = "n"
--  insert = "i"
--  visual = "v"
--  visual_block = "x"
--  term = "t"
--  command = "c"

map('', '<leader>cc', ':CommentToggle<CR>', opts) -- toggle comment on current line or selection
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts) -- toggle nvimtree
map('n', '<leader>nf', ':Neoformat<CR>', opts) -- format current buffer with neoformat
map('n', '<leader>~', ':Dashboard<CR>', opts) -- map show dashboard
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- clipboard mappings
map('n', '<leader>ya', ':%y+<CR>', opts) -- Copy content of entire buffer to system clipboard
map('n', '<leader>yl', '"+yy', opts) -- yank current line into system clipboard

-- write buffer changes
map('n', '<leader>W', ":w<CR>", opts)

-- gitsigns mappings
M.gitsigns_mappings = {
	noremap = true,
	['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
	['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

	['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
	['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
	['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
	['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
	['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
	['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
	['n <leader>gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
	['n <leader>gU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

	-- Text objects
	['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
}
--

--==Visual==--
-- stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- move text up and down
map("v", "<A-j>", ":m .+1<CR>gv-gv", opts)
map("v", "<A-k>", ":m .-2<CR>gv-gv", opts)
map("v", "p", "_dp", opts)

--==visual block==--
-- move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- buffer management
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map('n', '<leader>bd', ":Bdelete<CR>", opts)
--

-- window navigation
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)
--

-- terminal commands
map('n', '<leader><CR>', ':vs | terminal<CR>i', opts)
map('n', '<leader>\\', ':sp | terminal<CR>i', opts)
map('t', '<C-esc>', '<C-\\><C-n>', opts)
--

-- telescope pullup
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fw', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fg', ':Telescope git_commits<CR>', opts)
map('n', '<leader>fG', ':Telescope git_branches<CR>', opts)
--

map('n', '<leader>s', ':Telescope buffers<CR>', opts)

-- zk commands
map('n', '<leader>zn', '<Cmd>ZkNew { title = vim.fn.input("Title: ") }<CR>', opts) -- Create a new note after asking for its title.
map('n', '<leader>zo', '<Cmd>ZkNotes { sort = { "modified" } }<CR>', opts) -- Open notes.
map('n', '<leader>zt', '<Cmd>ZkTags<CR>', opts) -- Open notes associated with the selected tags.
map('n', '<leader>zf', '<Cmd>ZkNotes { sort = { "modified" }, match = vim.fn.input("Search: ") }<CR>', opts) -- Search for the notes matching a given query.
map('n', '<leader>zb', '<Cmd>ZkBacklinks<CR>', opts) -- Open notes linking to the current buffer.
map('n', '<leader>zl', '<Cmd>ZkLinks<CR>', opts) -- Open notes linked by the current buffer.

-- exit insert mode fast
map('i', 'jk', '<ESC>', opts)

return M
