-- Load All packer plugins
require('plugins.manager')

-- load keybindings and editor options
require('keymap')
require('options')

require('config.lsp')

local function set(var, val)
    vim.api.nvim_set_var(var, val)
end

set("srcery_bold", 1)
set("srcery_italic", 1)
set("srcery_underline", 1)
set("srcery_undercurl", 1)
set("srcery_inverse", 0)
set("srcery_inverse_matches", 1)
set("srcery_inverse_match_paren", 1)
set("srcery_dim_lisp_paren", 1)
set("srcery_bg_passthrough", 0)
set("srcery_guisp_fallback", "NONE")
set("srcery_italic_types", 1)
set("srcery_hard_black_terminal_bg", 1)

vim.cmd[[colorscheme kanagawa]]

-- # vim foldmethod=marker
