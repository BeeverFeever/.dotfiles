local packer = require("utils").get_package("packer")

packer.startup({
    function(use)
        use { "wbthomason/packer.nvim" }
        use { "nvim-lua/plenary.nvim", module = "plenary" }
        use { "kyazdani42/nvim-web-devicons" }


        -- git stuff
        use { "lewis6991/gitsigns.nvim",
            -- ft = "gitcommit",
            config = function()
                require("plugins.configs.gitsigns")
            end,
        }

        -- lsp stuff

        -- mason-lspconfig and nvim-lspconfig are setup when the lsp is setup
        -- with a call from the main init.lua file
        use { {
                "williamboman/mason.nvim",
            },{
                "williamboman/mason-lspconfig.nvim",
            },{
                "neovim/nvim-lspconfig",
            }
        }

        -- load snippets + cmp related in insert mode only

        use { {
                "hrsh7th/nvim-cmp",
                config = function()
                    require "plugins.configs.cmp"
                end,
            },{
                "hrsh7th/cmp-nvim-lsp",
            },{
                "dcampos/cmp-snippy",
                after = "nvim-cmp",
            },{
                "hrsh7th/cmp-nvim-lua",
                after = "nvim-cmp",
            },{
                "hrsh7th/cmp-buffer",
                after = "nvim-cmp",
            },{
                "hrsh7th/cmp-path",
                after = "nvim-cmp",
            },{
                "dcampos/nvim-snippy",
            },
        }

        -- misc plugins
        use { {
                "windwp/nvim-autopairs",
                after = "nvim-cmp",
                config = function()
                    require("plugins.configs.autopairs")
                end,
            },{"numToStr/Comment.nvim",
                keys = { "gc", "gb" },
                config = function()
                    require("plugins.configs.comment")
                end,
            },{
                "rebelot/heirline.nvim",
                config = function ()
                    require("plugins.configs.heirline")
                end
            },{
                "mfussenegger/nvim-dap",
            },{
                "rcarriga/nvim-dap-ui",
                config = function ()
                    require("plugins.configs.dap-ui")
                end
            }
        }

        -- file managing , picker etc
        use { {
                "kyazdani42/nvim-tree.lua",
                -- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
                config = function()
                    require("plugins.configs.nvimtree")
                end,
            },{
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                config = function()
                    require("plugins.configs.treesitter")
                end,
            },
        }

        -- telescope stuffs
        use { {
                "nvim-telescope/telescope.nvim",
                -- branch = "0.1.x",
                config = function()
                    require("plugins.configs.telescope")
                end,
            },{
                "BurntSushi/ripgrep",
            },{
                "nvim-telescope/telescope-fzf-native.nvim",
                run = 'make',
            },
        }

        -- colorschemes
        use {
            "rebelot/kanagawa.nvim",
        }

        -- plugins that I am either trying or just 'other'
        use {
            "simrat39/symbols-outline.nvim",
            config = function ()
                require("plugins.configs.symbols-outline")
            end
        }
    end,
})
