-- Load All packer plugins
require('plugins.manager')

-- load keybindings and editor options
require('keymap')
require('options')

vim.cmd[[colorscheme kanagawa]]

require('config.lsp')

-- # vim foldmethod=marker
