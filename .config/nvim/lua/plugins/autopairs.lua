return {
    "windwp/nvim-autopairs",
    opts = {
        check_ts = true,
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
        enable_close_bracket_line = false,
    },
    config = function(_, opts)
        local autopairs = utils.get_package("nvim-autopairs")
        -- local cmp_autopairs = utils.get_package("nvim-autopairs.completion.cmp")
        -- local cmp = utils.get_package("cmp")
        -- cmp.event:on(
        --     "confirm_done",
        --     cmp_autopairs.on_confirm_done()
        -- )
        -- autopairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
        autopairs.setup(opts)
    end,
}
