local packer = require("plugins.packer-init")

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost manager.lua source <afile> | PackerSync
    augroup end
]]

packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }        -- well its the plugin manager
    use { 'nvim-lua/popup.nvim' }           -- idek lmao
    use { 'nvim-lua/plenary.nvim' }         -- idek again lmao

    -- Colorschemes
    use { 'rebelot/kanagawa.nvim' }         -- this one is my colorscheme

    -- cmp plugins
    use {                                   -- auto completions 
        'hrsh7th/nvim-cmp',
        config = function()
            require("plugins.plugins.cmp")
        end
    }
    use { 'hrsh7th/cmp-buffer' }            -- buffer completions
    use { 'hrsh7th/cmp-path' }              -- path completions
    use { 'hrsh7th/cmp-cmdline' }           -- cmdline completions
    use { 'hrsh7th/cmp-nvim-lsp' }          -- lsp completions
    use { 'saadparwaiz1/cmp_luasnip' }      -- completion for luasnip
    use { 'hrsh7th/cmp-nvim-lua' }          -- completions for nvim lua api n shit

    -- snippets
    use { 'L3MON4D3/LuaSnip' }              -- hmm well its snippets for lua
    use { 'rafamadriz/friendly-snippets' }  -- some more randim snippets

    -- LSP
    use { 'neovim/nvim-lspconfig' }         -- makes it easy to config lsp ig
    use { 'williamboman/nvim-lsp-installer' } -- i think it just insatalls the lang servers

    -- Telescope
    use {                                   -- its just telescope (you can like search files with it) 
        'nvim-telescope/telescope.nvim',
        config = function ()
           require('plugins.plugins.telescope')
        end
    }

    -- sitting on that tree ya know
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function ()
            require('plugins.plugins.treesitter')
        end
    }
    use { 'p00f/nvim-ts-rainbow' }          -- yay prrrrrty colours

    -- OOOOO autopairs *fancy*
    use {
        'windwp/nvim-autopairs',
        config = function ()
            require('plugins.plugins.autopairs')
        end
    }

    -- COMMENTSSSSS!!! woooooooo
    use { 'numToStr/Comment.nvim' }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function ()
            require('plugins.plugins.comment')
        end
    }

    -- Git signs
    use { 
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('plugins.plugins.gitsigns')
        end
    }
end)
