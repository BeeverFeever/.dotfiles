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
            },{
                "jose-elias-alvarez/null-ls.nvim",
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
            },--[[ {
                "goolord/alpha-nvim",
                config = function()
                    require "plugins.configs.alpha"
                end,
            },{ 
                "famiu/bufdelete.nvim",
            }, ]]
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
            },--[[ {
                -- I'm undecided on this. just like with null-ls. Idk if I
                -- really need it.
                "mhartington/formatter.nvim",
                config = function ()
                    require("plugins.configs.formatter")
                end, 
            }, ]]
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

        -- breadcrumb stuff 
        use { {
                "SmiteshP/nvim-navic",
                config = function ()
                    require("plugins.configs.navic")
                end,
            },{
                -- TODO: change this back once he merges the pr for navic integration
                --"fgheng/winbar.nvim",
                "BeeverFeever/winbar.nvim",
                config = function ()
                    require("plugins.configs.winbar")
                end,
            },
        }

        -- colorschemes
        use {
            "rebelot/kanagawa.nvim",
        }

        -- plugins that I am either trying or just 'other'
        -- use { 
            -- "simrat29/symbols-outline.nvim",
            -- config = function ()
            --     require("plugins.configs.symbols-outline")
            -- end
            -- },
        -- }
    end,

    -- config = {
    --     display = {
    --         open_fn = require("packer.util").float,
    --         prompt_border = "single",
    --     },
    -- },
})
