local present, packer = pcall(require, "packer")
if not present then
    print("could not get packer")
    return
end

-- make sure packer is installed and if not install it
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd bufwritepost manager.lua source <afile> | 
    augroup end
]]

packer.startup({
    function(use)
        use { "wbthomason/packer.nvim" }
        -- some random things that are like should be in every config
        use { "nvim-lua/plenary.nvim", module = "plenary" }
        use { "kyazdani42/nvim-web-devicons" }

        use { "nvim-treesitter/nvim-treesitter",
            run = ":tsupdate",
            config = function()
              require("plugins.configs.treesitter")
            end,
        }

        -- git stuff
        use { "lewis6991/gitsigns.nvim",
            ft = "gitcommit",
            config = function()
                require("plugins.configs.gitsigns")
            end,
        }

        -- lsp stuff

        -- mason-lspconfig and nvim-lspconfig are setup when the lsp is setup
        -- with a call from the main init.lua file
        use { {
                "williamboman/mason.nvim",
                config = function()
                    require "plugins.configs.mason"
                end,
            },{
                "williamboman/mason-lspconfig.nvim",
                -- after = "mason.nvim",
            },{
                "neovim/nvim-lspconfig",
                -- after = "mason-lspconfig.nvim",
            }
        }

        -- load snippets + cmp related in insert mode only
        use {"dcampos/nvim-snippy",}

        use {
            "hrsh7th/nvim-cmp",
            config = function()
                require "plugins.configs.cmp"
            end,
        }

        use { {
                "hrsh7th/cmp-nvim-lsp",
                after = "nvim-cmp",
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
                "jose-elias-alvarez/null-ls.nvim",
                config = function ()
                    require("plugins.lsp.null-ls")
                end,
            },
        }

        -- misc plugins
        use {"windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.configs.autopairs")
            end,
        }

        use {"goolord/alpha-nvim",
            disable = true,
          config = function()
            require "plugins.configs.alpha"
          end,
        }

        use {"numToStr/Comment.nvim",
          keys = { "gc", "gb" },
          config = function()
              require("plugins.configs.comment")
          end,
        }

        use { 'j-hui/fidget.nvim',
            config = function ()
                require("plugins.configs.fidget")
            end
        }

        use { 'famiu/bufdelete.nvim' }

        -- file managing , picker etc
        use {"kyazdani42/nvim-tree.lua",
          cmd = { "NvimTreeToggle", "NvimTreeFocus" },
          config = function()
              require("plugins.configs.nvimtree")
          end,
        }

        use {"nvim-telescope/telescope.nvim",
          cmd = "Telescope",
          config = function()
              require "plugins.configs.telescope"
          end,
        }

        -- breadcrumb stuff (i think, i dont really know what breadcrumbs are)
        use { {
                "SmiteshP/nvim-navic",
                config = function ()
                    require("plugins.configs.navic")
                end,
            },{
                "fgheng/winbar.nvim",
                config = function ()
                    require("plugins.configs.winbar")
                end,
            },
        }

        -- colorschemes 
        use { {
                "rebelot/kanagawa.nvim",
                config = function ()
                    require("plugins.configs.colourschemes.kanagawa")
                end,
            },{
                "EdenEast/nightfox.nvim",
            },{
                "tiagovla/tokyodark.nvim",
            },{
                "kvrohit/mellow.nvim",
            },{
                "yashguptaz/calvera-dark.nvim",
            },{
                "shaunsingh/moonlight.nvim",
            },
        }
    end,

    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
