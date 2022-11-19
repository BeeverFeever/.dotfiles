local treesitter = require("utils").get_package("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "lua",
    "c",
    "cpp",
  },
  highlight = {
    enable = true,
  },
  -- this is experimental 
  indent = {
      enable = true,
  },
  autopairs = {
      enable = true,
  },
  additional_vim_regex_highlighting = true,
})
