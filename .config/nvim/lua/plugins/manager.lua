local packer = require("plugins.packer-init")

packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    
    -- Colorschemes
    use { 'rebelot/kanagawa.nvim' }
    
    -- cmp plugins
    use { 'hrsh7th/nvim-cmp' }            -- auto completion plugin
    use { 'hrsh7th/cmp-buffer' }          -- buffer completions
    use { 'hrsh7th/cmp-path' }            -- path completions
    use { 'hrsh7th/cmp-cmdline' }         -- cmdline completions
    use { 'saadparwaiz1/cmp_luasnip' }    -- snippet completion   

    -- snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }
    
    -- Does something so that i have no clue lmao so dont touch ig
    if PACKER_BOOSTRAP then
        require("packer").sync()
    end
end)
