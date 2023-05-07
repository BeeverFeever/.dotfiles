local treesitter = require("utils").get_package("nvim-treesitter.configs")

treesitter.setup({
    ensure_installed = {
        "lua",
        "c",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
