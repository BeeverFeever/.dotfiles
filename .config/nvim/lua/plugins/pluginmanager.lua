local packer = require("plugins.packer-init")

packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'rebelot/kanagawa.nvim' }
end)
