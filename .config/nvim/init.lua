-- Load All packer plugins
require('plugins.manager')

-- load keybindings and editor options
require('keymap')
require('options')
require('autocmds')

-- load theme loading library
-- local scheme = require('lib.scheme')

-- Load Themes (loads everforest theme by default)
-- load editor color theme
-- scheme.load_scheme('kanagawa')
vim.cmd[[colorscheme kanagawa]]
-- load statusline theme
-- scheme.load_lualine_scheme('gruvbox-material')

-- if you don't  want to specify the theme for each component,
-- you can use the following function
-- scheme.load_shared_scheme('kanagawa')

-- set the statusline and tabline style
-- you can change the characters used
-- for seperators in the statusline and tabline
-- for instance, we can use bubble characters
-- scheme.load_global_style({'', ''}, {'', ''})

-- load configurations
-- config.plug loads plugin configurations
-- config.lsp handles al lsp server configuration
-- config.module loads user contrib files (work in progress)
require('config.lsp.init')
require('plugins.configs')

-- # vim foldmethod=marker
