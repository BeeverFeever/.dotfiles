local M = {}
local opts = { noremap = true, silent = true }

local mappings = {
	-- exit insert mode
	{ "i", "jk", "<ESC>", opts },

	-- no highlights
	{ "n", "<ESC>", "<cmd> noh <CR>", opts },

	-- switch between windows
	{ "n", "<A-h>", "<C-w>h", opts },
	{ "n", "<A-l>", "<C-w>l", opts },
	{ "n", "<A-j>", "<C-w>j", opts },
	{ "n", "<A-k>", "<C-w>k", opts },

	-- resize windows
	-- TODO: find a way to make these fucking logical becase these are just
	-- annoying to use
	{ "n", "<A-Up>", "<cmd>resize -2<CR>", opts },
	{ "n", "<A-Down>", "<cmd>resize +2<CR>", opts },
	{ "n", "<A-Left>", "<cmd>vertical resize -2<CR>", opts },
	{ "n", "<A-Right>", "<cmd>vertical resize +2<CR>", opts },

	-- toggle numbers {with relative line numbers}
	{ "n", "<leader>n", '<cmd>lua vim.cmd("set rnu! nu!") <CR>', opts },

	-- use j and k to move through wrapped lines
	-- gotten from https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
	{ "n", "k", 'v:count ? "k" : "gk"', { silent = true, expr = true } },
	{ "n", "j", 'v:count ? "j" : "gj"', { silent = true, expr = true } },

	-- does some pasting magic, got it from NvChad
	{ "v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts },

	-- nvim tree
	{ "n", "<leader>t", "<cmd> NvimTreeToggle <CR>", opts },

	-- move text around
	{ "x", "<S-j>", ":m '>+1<CR>gv-gv", opts },
	{ "x", "<S-k>", ":m '<-2<CR>gv-gv", opts },

	-- stay in visual mode when indenting
	{ "v", "<", "<gv", opts },
	{ "v", ">", ">gv", opts },
}
require("utils").set_keymaps(mappings)

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

M.diagnostics = function()
	local diagnostics_opts = { silent = true, noremap = true }
	local diagnostics_mappings = {
		{ "n", "<space>e", vim.diagnostic.open_float, diagnostics_opts },
		{ "n", "[d", vim.diagnostic.goto_prev, diagnostics_opts },
		{ "n", "]d", vim.diagnostic.goto_next, diagnostics_opts },
		-- TODO: change this to be a plugin like trouble.nvim
		{ "n", "<space>q", vim.diagnostic.setloclist, diagnostics_opts },
	}
	require("utils").set_keymaps(diagnostics_mappings)
end

M.lsp = function(bufnr)
	local lsp_opts = { silent = true, noremap = true, buffer = bufnr }
	local lsp_mappings = {
		{ "n", "gD", vim.lsp.buf.declaration, lsp_opts },
		{ "n", "gd", vim.lsp.buf.definition, lsp_opts },
		{ "n", "K", vim.lsp.buf.hover, lsp_opts },
		{ "n", "gi", vim.lsp.buf.implementation, lsp_opts },
		{ "n", "<C-k>", vim.lsp.buf.signature_help, lsp_opts },
		{ "n", "<space>D", vim.lsp.buf.type_definition, lsp_opts },
		{ "n", "<space>rn", vim.lsp.buf.rename, lsp_opts },
		{ "n", "<space>ca", vim.lsp.buf.code_action, lsp_opts },
		{ "n", "gr", vim.lsp.buf.references, lsp_opts },
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

M.telescope = {
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

return M
