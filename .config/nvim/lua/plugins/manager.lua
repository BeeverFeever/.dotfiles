local packer = require('packer')

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost manager.lua source <afile> | PackerSync
    augroup end
]]

packer.startup({
    function(use)
        -- packer self management and general purpose plugins
        use { 'wbthomason/packer.nvim' }
        use { 'nvim-lua/popup.nvim' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'kyazdani42/nvim-web-devicons' }

        --  lsp/autocompletion/snippets
        -- lsp plugins
        use { 'neovim/nvim-lspconfig' }
        use { 'williamboman/nvim-lsp-installer' }
        use { 'jose-elias-alvarez/null-ls.nvim' }

        -- autocompletion
        use {
            'hrsh7th/nvim-cmp',
            config = function()
                require('plugins.configs.cmp')
            end
        }
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'dcampos/cmp-snippy' }
        use {
            'mickael-menu/zk-nvim',
            config = function()
                require('plugins.configs.zk-nvim')
            end
        }
        use { 'folke/trouble.nvim' } -- config it

        -- webdev
        use { 'othree/html5.vim' }
        use { 'pangloss/vim-javascript' }
        use { 'evanleck/vim-svelte' }

        -- snippets
        use { 'dcampos/nvim-snippy' }

        --  utility plugins
        -- these plugins are all realted to editor configs
        use { 'famiu/bufdelete.nvim' }
        use {
            'akinsho/bufferline.nvim',
            config = function()
                require('plugins.configs.bufferline')
            end
        }
        use {
            'nvim-lualine/lualine.nvim',
            config = function()
                require('plugins.configs.lualine')
            end
        }

        -- Telescope stuffs
        use {
            'nvim-telescope/telescope.nvim',
            config = function()
                require('plugins.configs.telescope')
            end
        }
        use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        }

        use {
            'kyazdani42/nvim-tree.lua',
            config = function()
                require("plugins.configs.nvimtree")
            end
        }

        use {
            'windwp/nvim-autopairs',
            config = function()
                require("plugins.configs.autopairs")
            end
        }
        use {
            'terrortylor/nvim-comment',
            config = function()
                require("plugins.configs.nvimcomment")
            end
        }
        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require("plugins.configs.gitsigns")
            end
        }
        --

        --  imporved syntax plugins
        -- these add in a bit more bling and flair to nvim
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require("plugins.configs.treesitter")
            end
        }
        use {
            'goolord/alpha-nvim',
            config = function()
                require("plugins.configs.alpha")
            end
        }

        -- colourthemes
        -- popular themes incoming
        use {
            'norcalli/nvim-colorizer.lua',
            config = function()
                require("plugins.configs.colorizer")
            end
        }

        use {
            'srcery-colors/srcery-vim',
            config = function()
                require("plugins.configs.srcery")
            end
        }
        use {
            'rebelot/kanagawa.nvim',
            config = function()
                require("plugins.configs.kanagawa")
            end
        }
        use { 'tiagovla/tokyodark.nvim' }
        use { 'navarasu/onedark.nvim' }
        use { 'mcchrish/zenbones.nvim' }

        --
    end,
    -- display packer dialouge in the center in a floating window
    config = {
        display = {
            open_fn = require('packer.util').float,
        },
    },
})
