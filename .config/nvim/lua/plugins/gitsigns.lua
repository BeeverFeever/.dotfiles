local gitsigns = require("utils").get_package("gitsigns")
local settings = require("utils").get_package("my-globals")

gitsigns.setup({
    signs = {
        add          = { hl = 'GitSignsAdd', text = settings.icons.git_signs.add, numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = settings.icons.git_signs.change, numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = settings.icons.git_signs.delete, numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = settings.icons.git_signs.topdelete, numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = settings.icons.git_signs.changedelete, numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        untracked    = { hl = 'GitSignsAdd', text = settings.icons.git_signs.untracked, numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    },

    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },

    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_formatter = '<author>, <author_time> - <summary>',
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
    },

    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,

    preview_config = {
        -- Options passed to nvim_open_win
        border = settings.border_style,
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },

    yadm = {
        enable = false,
    },
    -- keymapping
    on_attach = function ()
        require("utils").get_package("keymaps").gitsigns()
    end,
})
