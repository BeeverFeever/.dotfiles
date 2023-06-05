--local packer = require("utils").get_package("packer")
local lazy = require("utils").get_package("lazy")

lazy.setup({
    "rebelot/kanagawa.nvim",
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",

    -- git stuff
    { "lewis6991/gitsigns.nvim",
        -- ft = "gitcommit",
        config = function()
            require("plugins.gitsigns")
        end,
    },

    -- lsp stuff

    -- mason-lspconfig and nvim-lspconfig are setup when the lsp is setup
    -- with a call from the main init.lua file
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- load snippets + cmp related in insert mode only

    { "hrsh7th/nvim-cmp",
        config = function()
            require "plugins.cmp"
        end,
    },

    "hrsh7th/cmp-nvim-lsp",
    "dcampos/cmp-snippy",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "dcampos/nvim-snippy",

    -- misc plugins
    { "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
            require("plugins.autopairs")
        end,
    },

    { "numToStr/Comment.nvim",
        keys = { "gc", "gb" },
        config = function()
            require("plugins.comment")
        end,
    },

    { "rebelot/heirline.nvim",
        config = function ()
            require("plugins.heirline")
        end
    },

    { "folke/trouble.nvim",
        config = function ()
            require("plugins.trouble")
        end
    },

    -- file managing , picker etc
    { "stevearc/oil.nvim",
        config = function ()
            require("plugins.oil")
        end
    },

    -- { "kyazdani42/nvim-tree.lua",
    --     -- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    --     config = function()
    --         require("plugins.nvimtree")
    --     end,
    -- },

    { "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end,
    },

    -- telescope stuffs
    { "nvim-telescope/telescope.nvim",
        -- branch = "0.1.x",
        config = function()
            require("plugins.telescope")
        end,
    },

    { "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
    },
})
