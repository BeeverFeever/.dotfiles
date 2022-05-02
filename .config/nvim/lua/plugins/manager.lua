local packer = require('packer')

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plug.lua source <afile> | PackerSync
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

        -- autocompletion
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/nvim-cmp' }

        -- snippets
        use { 'dcampos/nvim-snippy' }
        -- 

        --  utility plugins
        -- these plugins are all realted to editor configs
        use { 'nvim-lualine/lualine.nvim' }
        use { 'kdheepak/tabline.nvim' }
        use { 'nvim-telescope/telescope.nvim' }
        
        use { 
            'nvim-telescope/telescope-fzf-native.nvim', 
            run = 'make' 
        }
        
        use { 
	    'kyazdani42/nvim-tree.lua',
	    config = function()
	    	require("configs.nvimtree")
	    end
	}
	
        use { 'windwp/nvim-autopairs' }
        use { 'terrortylor/nvim-comment' }
        use { 'sbdchd/neoformat' }
        use { 'lewis6991/gitsigns.nvim' }
        -- 

        --  imporved syntax plugins
        -- these add in a bit more bling and flair to nvim
        use { 
            'nvim-treesitter/nvim-treesitter', 
            run = ':TSUpdate' 
        }
        use { 'goolord/alpha-nvim' }
        use { 'norcalli/nvim-colorizer.lua' }
        -- 

        --  themes
        -- popular themes incoming
        use { 'rebelot/kanagawa.nvim' }
        use { 'tiagovla/tokyodark.nvim' }
        use { 'navarasu/onedark.nvim'}

        --
    end,
    -- display packer dialouge in the center in a floating window
    config = {
        display = {
            open_fn = require('packer.util').float,
        },
    },
})
