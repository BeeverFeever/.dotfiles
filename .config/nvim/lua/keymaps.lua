-- n, v, i, t = mode names

local M = {}
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- exit insert mode
map('i', 'jk', '<ESC>', opts)

-- no highlights
map('n', '<ESC>', '<cmd> noh <CR>', opts)

-- switch between windows
map('n', '<A-h>', '<C-w>h', opts)
map('n', '<A-l>', '<C-w>l', opts)
map('n', '<A-j>', '<C-w>j', opts)
map('n', '<A-k>', '<C-w>k', opts)

-- save
-- map('n', '<C-s>', '<cmd> w <CR>', opts)

-- close buffer : uses bufdelete.nvim
map('n', '<leader>x', '<cmd>Bdelete!<CR>', opts)

M.toggle_nums = function()
    -- i kinda want a more lua way of doing this but i couldn't figure it out
    vim.cmd("set rnu! nu!")
end

-- toggle numbers (with relative line numbers)
map('n', '<leader>n', '<cmd>lua require("keymaps").toggle_nums()<CR>', opts)

-- does some pasting magic got it from NvChad
map('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', opts)

-- nvim tree
map('n', '<leader>t', "<cmd> NvimTreeToggle <CR>", opts)

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

M.lspconfig = {

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["d]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.formatting {}
      end,
      "lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
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

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current_context",
    },
  },
}

M.gitsigns =  {
    -- this has definitely not been yoinked from the gitsigns github page
    function(bufnr)
        local gs = package.loaded.gitsigns

        local function map_git(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap_git.set(mode, l, r, opts)
        end

        -- Navigation
        map_git('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map_git('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        -- Actions
        map_git({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map_git({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map_git('n', '<leader>hS', gs.stage_buffer)
        map_git('n', '<leader>hu', gs.undo_stage_hunk)
        map_git('n', '<leader>hR', gs.reset_buffer)
        map_git('n', '<leader>hp', gs.preview_hunk)
        map_git('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map_git('n', '<leader>tb', gs.toggle_current_line_blame)
        map_git('n', '<leader>hd', gs.diffthis)
        map_git('n', '<leader>hD', function() gs.diffthis('~') end)
        map_git('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map_git({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

return M
