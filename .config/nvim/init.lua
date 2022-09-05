-- Load All packer plugins
require('plugins.manager')

-- load some things
require('keymap')
require('options')

require('config.lsp')

local function set(var, val)
    vim.api.nvim_set_var(var, val)
end

vim.cmd[[colorscheme kanagawa]]

-- # vim foldmethod=marker
